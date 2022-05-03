resource "ibm_toolchain_tool_git" "app_repo" {
  git_provider = var.app_repo_type
  toolchain_id = var.toolchain_id
  name         = "app-repo"
  initialization {
    type = "clone"
    source_repo_url = var.app_repo
    private_repo = true
    repo_name = join("-", [split(".", split("/", var.app_repo)[4])[0], formatdate("DDMMYYYYhhmmss", timestamp())])
  }  
  parameters {
    has_issues          = false
    enable_traceability = false
  }
}

resource "ibm_toolchain_tool_git" "pipeline_repo" {
  git_provider = var.pipeline_repo_type
  toolchain_id = var.toolchain_id
  name         = "pipeline-repo"  
  initialization {
    type = "clone"
    repo_url = var.pipeline_repo
    private_repo = true
    repo_name = join("-", [split(".", split("/", var.pipeline_repo)[4])[0], formatdate("DDMMYYYYhhmmss", timestamp())])
  }
  parameters {
    has_issues          = false
    enable_traceability = false
  }
}

resource "ibm_toolchain_tool_git" "inventory_repo" {
  git_provider = var.inventory_repo_type
  toolchain_id = var.toolchain_id
  name         = "inventory-repo"
  initialization {
    type = "clone"
    source_repo_url = var.inventory_repo
    private_repo = true
    repo_name = join("-", [split(".", split("/", var.inventory_repo)[4])[0], formatdate("DDMMYYYYhhmmss", timestamp())])
  }  
  parameters {
    has_issues          = false
    enable_traceability = false
  }
}

resource "ibm_toolchain_tool_git" "evidence_repo" {
  git_provider = var.evidence_repo_type
  toolchain_id = var.toolchain_id
  name         = "evidence-repo"
  initialization {
    type = "clone"
    source_repo_url = var.evidence_repo
    private_repo = true
    repo_name = join("-", [split(".", split("/", var.evidence_repo)[4])[0], formatdate("DDMMYYYYhhmmss", timestamp())])
  }  
  parameters {
    has_issues          = false
    enable_traceability = false
  }
}

resource "ibm_toolchain_tool_git" "issues_repo" {
  git_provider = var.issues_repo_type
  toolchain_id = var.toolchain_id
  name         = "issues-repo"
  initialization {
    type = "clone"
    source_repo_url = var.issues_repo
    private_repo = true
    repo_name = join("-", [split(".", split("/", var.issues_repo)[4])[0], formatdate("DDMMYYYYhhmmss", timestamp())])
  }   
  parameters {
    has_issues          = true
    enable_traceability = false
  }
}

output "app_repo_url" {
  value = ibm_toolchain_tool_git.app_repo.parameters[0].repo_url
}

output "pipeline_repo_url" {
  value = ibm_toolchain_tool_git.pipeline_repo.parameters[0].repo_url
}

output "inventory_repo_url" {
  value = ibm_toolchain_tool_git.inventory_repo.parameters[0].repo_url
}

output "evidence_repo_url" {
  value = ibm_toolchain_tool_git.evidence_repo.parameters[0].repo_url
}

output "issues_repo_url" {
  value = ibm_toolchain_tool_git.issues_repo.parameters[0].repo_url
}