locals {

  repo_url_raw = try(trimsuffix(var.repository_data.repository_url, ".git"), "")
  repo_branch = try(var.repository_data.default_branch, "master")
  repo_owner = try(var.repository_data.repository_owner, "")

  git_provider = (
    (strcontains(local.repo_url_raw, "git.cloud.ibm.com")) ? "hostedgit" : "githubconsolidated"
  )

  git_id = (
    (strcontains(local.repo_url_raw, "github.ibm.com")) ? "integrated" : ""
  )

  secret_ref = try(var.repository_data.git_token_secret_ref, "")
  repo_name = basename(local.repo_url_raw)


  triggers = try(var.repository_data.triggers, "{}") 
  pre_process_trigger_data = flatten([for trigger in local.triggers : {
      type         = try(trigger.type, "")
      name         = try(trigger.name, "")
      worker_id    = try(trigger.worker_id, "")
      properties   = try(trigger.properties, "{}")
      pipeline_id  = var.pipeline_id
    }
  ])
}



# Create a repository integration
module "app_repo" {
  #count                 = (var.create_repo_integration) ? 1 : 0
  source                = "../repositories"
  tool_name             = local.repo_name
  toolchain_id          = var.toolchain_id
  git_provider          = local.git_provider
  initialization_type   = "link"
  repository_url        = local.repo_url_raw
  source_repository_url = ""
  repository_name       = local.repo_name 
  is_private_repo       = true
  owner_id              = local.repo_owner #(local.repo_owner == "") ? var.repository_owner : local.repo_owner #repository_data takes precedence
  issues_enabled        = true
  traceability_enabled  = false
  integration_owner     = local.repo_owner #(local.repo_owner == "") ? var.repository_owner : local.repo_owner #repository_data takes precedence
  auth_type             = "oauth" #(local.secret_ref == "") ? "oauth" : "pat"
  secret_ref            = local.secret_ref
  git_id                = local.git_id
  default_git_provider  = ""
}


#This is the structure being passed with each loop
# into `trigger_data`
#    {
#      "name" = "trigger1"
#      "properties" = []
#      "type" = "manual"
#      "worker_id" = "example1"
#    }

# Create a Trigger
module "triggers" {
  source               = "../triggers"
  for_each = tomap({
    for t in local.pre_process_trigger_data : "${t.name}" => t
  })
  trigger_data = each.value
}
