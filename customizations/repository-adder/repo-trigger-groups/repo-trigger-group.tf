locals {

  # Compare top level variables with equivalent variables in `repository_data`. Values in `repository_data` take precedence.
  # `git_token_secret_ref`
  # `repository_owner`
  # `mode`
  # `default_branch`
  # `worker_id`

  git_token_secret_ref = try(var.repository_data.git_token_secret_ref, var.git_token_secret_ref)
  default_branch       = try(var.repository_data.default_branch, var.default_branch)
  repository_owner     = try(var.repository_data.repository_owner, var.repository_owner)
  mode                 = try(var.repository_data.mode, var.mode)
  worker_id            = try(var.repository_data.worker_id, var.worker_id)

  repo_url_raw = try(trimsuffix(var.repository_data.repository_url, ".git"), "")

  git_provider = (
    (strcontains(local.repo_url_raw, "git.cloud.ibm.com")) ? "hostedgit" : "githubconsolidated"
  )

  git_id = (
    (strcontains(local.repo_url_raw, "github.ibm.com")) ? "integrated" : ""
  )

  event_listener = (strcontains(local.repo_url_raw, "git.cloud.ibm.com")) ? "ci-listener-gitlab" : "ci-listener"
  # Ensure there is a name for the repository integration. If not use the name of the taken from the `repository_url`
  input_repo_name = try(var.repository_data.name, "")
  repo_name       = (local.input_repo_name == "") ? basename(local.repo_url_raw) : local.input_repo_name

  # Ensure there is at least an empty element for triggers
  triggers = try(var.repository_data.triggers, [])
  #pre-process to ensure the element key is present
  pre_process_trigger_data = flatten([for trigger in local.triggers : {
    type                = try(trigger.type, "")
    name                = try(trigger.name, "")
    worker_id           = try(trigger.worker_id, "")
    properties          = try(trigger.properties, [])
    event_listener      = local.event_listener
    time_zone           = try(trigger.time_zone, "")
    cron_schedule       = try(trigger.cron_schedule, "")
    trigger_enable      = try(trigger.trigger_enable, true)
    max_concurrent_runs = try(trigger.max_concurrent_runs, 1)
    pipeline_id         = var.pipeline_id
    default_branch      = local.default_branch
    trigger_events      = try(trigger.trigger_events, [])
    repo_url            = try(trigger.trigger_events, local.repo_url_raw)
    }
  ])
}

# Create a repository integration
module "app_repo" {
  source                = "../../repositories"
  tool_name             = local.repo_name
  toolchain_id          = var.toolchain_id
  git_provider          = local.git_provider
  initialization_type   = local.mode
  repository_url        = local.repo_url_raw
  source_repository_url = local.repo_url_raw
  repository_name       = local.repo_name
  is_private_repo       = true
  owner_id              = local.repository_owner
  issues_enabled        = true
  traceability_enabled  = false
  integration_owner     = ""
  auth_type             = (local.git_token_secret_ref == "") ? "oauth" : "pat"
  secret_ref            = local.git_token_secret_ref
  git_id                = local.git_id
  default_git_provider  = ""
}


#This is the structure being passed with each loop
# into `trigger_data`
#    {
#     type                =
#     name                =
#     worker_id           =
#     properties          =
#     event_listener      =
#     time_zone           =
#     cron_schedule       =
#     trigger_enable      =
#     max_concurrent_runs =
#     pipeline_id         =
#    }

# Create a Trigger
module "triggers" {
  depends_on = [module.app_repo.repository]
  source     = "../../triggers"
  for_each = tomap({
    for t in local.pre_process_trigger_data : "${t.name}" => t
  })
  trigger_data = each.value
  # This is to ensure that the repository integration has been created before proceeding. A Git trigger requires the tool_id to be available
  repository_integration_id = module.app_repo.repository.tool_id
}

module "default_triggers" {
  count                     = ((var.create_default == true) && (length(local.triggers) == 0)) ? 1 : 0
  depends_on  = [module.app_repo.repository]
  source      = "./default_triggers"
  pipeline_id = var.pipeline_id
  #pr_pipeline_id            =
  repository_url            = local.repo_url_raw
  branch                    = local.default_branch
  repository_integration_id = module.app_repo.repository.tool_id
}
