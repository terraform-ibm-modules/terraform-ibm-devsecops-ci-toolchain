

locals {
  # Note terraform 1.3.x allows startswith() function
  # but terraform 1.x uses regexall
  is_staging = length(regexall("^crn:v1:staging:.*$", var.toolchain_crn)) > 0
  # is_staging = startswith(var.toolchain_crn, "crn:v1:staging:")
  git_dev = "https://dev.us-south.git.test.cloud.ibm.com"
  git_mon01 = "https://mon01.git.cloud.ibm.com"
  git_fr2 = "https://private.eu-fr2.git.cloud.ibm.com"
  compliance_pipelines_git_server = (
    (local.is_staging) ? local.git_dev 
    : (var.toolchain_region == "eu-fr2")? local.git_fr2
    : format("https://%s.git.cloud.ibm.com", var.toolchain_region)
  )
  # in dev/staging, compliance_pipelines_git_server is dev and clone_from_git_server is mon01
  clone_from_git_server = (
    (local.is_staging) ? local.git_mon01 : local.compliance_pipelines_git_server
  )

  app_repo_mode = ((length(var.app_repo_existing_url) > 0)? "byo_app"
    : (length(var.app_repo_clone_from_url) > 0) ? "byo_sample"
    : "auto-sample")

  app_repo_clone_from = (
    (local.app_repo_mode == "byo_app") ? ""
    : (local.app_repo_mode == "byo_sample") ? var.app_repo_clone_from_url
    : format("%s/open-toolchain/hello-compliance-app.git", local.clone_from_git_server)
  )
  app_repo_git_provider = (
    (local.app_repo_mode == "byo_app") ? 
        ((length(var.app_repo_existing_git_provider) > 0)? var.app_repo_existing_git_provider
          : "hostedgit"
        )
    : (local.app_repo_mode == "byo_sample") ?
        ((length(var.app_repo_clone_to_git_provider) > 0)? var.app_repo_clone_to_git_provider
          : "hostedgit"
        )
    : "hostedgit"
  )
  app_repo_git_id = (
    (local.app_repo_mode == "byo_app") ? 
        ((length(var.app_repo_existing_git_id) > 0)? var.app_repo_existing_git_id
          : ""
        )
    : (local.app_repo_mode == "byo_sample") ?
        ((length(var.app_repo_clone_to_git_id) > 0)? var.app_repo_clone_to_git_id
          : ""
        )
    : ""
  )
  app_repo_branch = (
    (local.app_repo_mode == "byo_app") ? 
        ((length(var.app_repo_existing_branch) > 0)? var.app_repo_existing_branch
          : file("[Error] var app_repo_existing_branch must be provided when using var app_repo_existing_url.")
        )
    : (local.app_repo_mode == "byo_sample") ?
        ((length(var.app_repo_clone_from_branch) > 0)? var.app_repo_clone_from_branch
          : file("[Error] var app_repo_clone_from_branch must be provided when using var app_repo_clone_from_url.")
        )
    : "master" # hello-compliance-app has branch master
  )
  config_repo_branch = local.app_repo_branch # not yet support for separate config repo url/branch

  app_repo_provider_webhook_syntax = (
    ((local.app_repo_git_provider == "hostedgit") || (local.app_repo_git_provider == "gitlab")) 
    ? "gitlab"
    : (local.app_repo_git_provider == "githubconsolidated")
    ? "github"
    : (file("[Error] Unrecognized git provider"))
    )
}

resource "ibm_cd_toolchain_tool_hostedgit" "app_repo_clone_from_hostedgit" {
  count = (local.app_repo_git_provider == "hostedgit" 
            && ((local.app_repo_mode == "byo_sample") 
                 || (local.app_repo_mode == "auto-sample") )
          ) ? 1 : 0

  toolchain_id = var.toolchain_id
  name         = "app-repo"
  initialization {
    type = "clone_if_not_exists"
    source_repo_url = local.app_repo_clone_from
    private_repo = true
    repo_name = join("-", [ var.repositories_prefix, "app-repo" ])
    git_id = local.app_repo_git_id    
    owner_id                 = var.app_group
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "app_repo_existing_hostedgit" {
  count = (local.app_repo_git_provider == "hostedgit" 
            && (local.app_repo_mode == "byo_app")
          ) ? 1 : 0

  toolchain_id = var.toolchain_id
  name         = "app-repo"
  initialization {
    type = "link"
    repo_url = var.app_repo_existing_url
    git_id = local.app_repo_git_id
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
  }
}

resource "ibm_cd_toolchain_tool_githubconsolidated" "app_repo_clone_from_githubconsolidated" {
  count = (local.app_repo_git_provider == "githubconsolidated" 
            && ((local.app_repo_mode == "byo_sample") 
                 || (local.app_repo_mode == "auto-sample") )
          ) ? 1 : 0

  toolchain_id = var.toolchain_id
  name         = "app-repo"
  initialization {
    type = "clone_if_not_exists"
    source_repo_url = local.app_repo_clone_from
    private_repo = true
    repo_name = join("-", [ var.repositories_prefix, "app-repo" ])
    git_id = local.app_repo_git_id
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
  }
}

resource "ibm_cd_toolchain_tool_githubconsolidated" "app_repo_existing_githubconsolidated" {
  count = (local.app_repo_git_provider == "githubconsolidated" 
            && (local.app_repo_mode == "byo_app")
          ) ? 1 : 0

  toolchain_id = var.toolchain_id
  name         = "app-repo"
  initialization {
    type = "link"
    repo_url = var.app_repo_existing_url
    git_id = local.app_repo_git_id
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "pipeline_repo" {
  toolchain_id = var.toolchain_id
  name         = "pipeline-repo"
  initialization {
    type = "link"
    repo_url = format("%s/open-toolchain/compliance-pipelines.git", local.compliance_pipelines_git_server)
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "inventory_repo" {
  toolchain_id = var.toolchain_id
  name         = "inventory-repo"
  initialization {
    type = "clone_if_not_exists"
    source_repo_url = format("%s/open-toolchain/compliance-inventory.git", local.clone_from_git_server)
    private_repo = true
    repo_name = join("-", [ var.repositories_prefix, "inventory-repo" ])
    owner_id                 = var.inventory_group
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "evidence_repo" {
  toolchain_id = var.toolchain_id
  name         = "evidence-repo"
  initialization {
    type = "clone_if_not_exists"
    source_repo_url = format("%s/open-toolchain/compliance-evidence-locker.git", local.clone_from_git_server)
    private_repo = true
    repo_name = join("-", [ var.repositories_prefix, "evidence-repo" ])
    owner_id                 = var.evidence_group
  }
  parameters {
    toolchain_issues_enabled = false
    enable_traceability      = false
  }
}

resource "ibm_cd_toolchain_tool_hostedgit" "issues_repo" {
  toolchain_id = var.toolchain_id
  name         = "issues-repo"
  initialization {
    type = "clone_if_not_exists"
    source_repo_url = format("%s/open-toolchain/compliance-incident-issues.git", local.clone_from_git_server)
    private_repo = true
    repo_name = join("-", [ var.repositories_prefix, "issues-repo" ])
    owner_id                 = var.issues_group
  }
  parameters {
    toolchain_issues_enabled = true
    enable_traceability      = false
  }
}

output "app_repo_url" {
  value = (((local.app_repo_git_provider == "hostedgit") && (local.app_repo_mode == "byo_app")) 
          ? ibm_cd_toolchain_tool_hostedgit.app_repo_existing_hostedgit[0].parameters[0].repo_url
          : ((local.app_repo_git_provider == "hostedgit") && (local.app_repo_mode != "byo_app")) 
          ? ibm_cd_toolchain_tool_hostedgit.app_repo_clone_from_hostedgit[0].parameters[0].repo_url
          : ((local.app_repo_git_provider == "githubconsolidated") && (local.app_repo_mode == "byo_app")) 
          ? ibm_cd_toolchain_tool_githubconsolidated.app_repo_existing_githubconsolidated[0].parameters[0].repo_url
          : ((local.app_repo_git_provider == "githubconsolidated") && (local.app_repo_mode != "byo_app")) 
          ? ibm_cd_toolchain_tool_githubconsolidated.app_repo_clone_from_githubconsolidated[0].parameters[0].repo_url
          : file("[Error] internal error in computing local values"))
  description = "The app repository instance url containing an application that can be built and deployed with the reference DevSecOps toolchain templates."
}

output "app_repo_branch" {
  value = local.app_repo_branch
  description = "The app repo default branch that will be used by the CI build, usually either main or master."
}

output "config_repo_branch" {
  value = local.config_repo_branch
  description = "The config or app repo branch containing the .pipeline-config.yaml file; usually main or master."
}


output "pipeline_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.pipeline_repo.parameters[0].repo_url
  description = "This repository url contains the tekton definitions for compliance pipelines"
}

output "inventory_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.inventory_repo.parameters[0].repo_url
  description = "The inventory repository instance url, with details of which artifact has been built and will be deployed"
}

output "evidence_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.evidence_repo.parameters[0].repo_url
  description = "The evidence repository instance url, where evidence of the builds and scans are stored, ready for any compliance audit"
}

output "issues_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.issues_repo.parameters[0].repo_url
  description = "The incident issues repository instance url, where issues are created when vulnerabilities and CVEs are detected"
}

output "inventory_repo" {
  value = ibm_cd_toolchain_tool_hostedgit.inventory_repo
}

output "evidence_repo" {
  value = ibm_cd_toolchain_tool_hostedgit.evidence_repo
}

output "issues_repo" {
  value = ibm_cd_toolchain_tool_hostedgit.issues_repo
}

# output "test_output" {
#   value = format("test output: %s, is_staging %s, clone_from_git_server: %s, compliance_pipelines_git_server: %s",
#     var.toolchain_crn, local.is_staging, local.clone_from_git_server, local.compliance_pipelines_git_server)
# }

output "app_repo_provider_webhook_syntax" {
  value = local.app_repo_provider_webhook_syntax
}
