resource "ibm_cd_toolchain_tool_hostedgit" "app_repo" {
  toolchain_id = var.toolchain_id
  name         = "app-repo"
  initialization {
    type = "clone_if_not_exists"
    source_repo_url = var.app_repo
    private_repo = true
    repo_name = join("-", [ var.repositories_prefix, "app-repo" ])
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
    repo_url = var.pipeline_repo
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
    source_repo_url = var.inventory_repo
    private_repo = true
    repo_name = join("-", [ var.repositories_prefix, "inventory-repo" ])
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
    source_repo_url = var.evidence_repo
    private_repo = true
    repo_name = join("-", [ var.repositories_prefix, "evidence-repo" ])
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
    source_repo_url = var.issues_repo
    private_repo = true
    repo_name = join("-", [ var.repositories_prefix, "issues-repo" ])
  }   
  parameters {
    toolchain_issues_enabled = true
    enable_traceability      = false
  }
}

output "app_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.app_repo.parameters[0].repo_url
}

output "pipeline_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.pipeline_repo.parameters[0].repo_url
}

output "inventory_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.inventory_repo.parameters[0].repo_url
}

output "evidence_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.evidence_repo.parameters[0].repo_url
}

output "issues_repo_url" {
  value = ibm_cd_toolchain_tool_hostedgit.issues_repo.parameters[0].repo_url
}
