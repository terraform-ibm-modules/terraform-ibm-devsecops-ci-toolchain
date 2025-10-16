resource "ibm_cd_tekton_pipeline" "ci_pipeline_instance" {
  pipeline_id = var.pipeline_id
  worker {
    id = var.worker_id
  }
  enable_notifications = var.enable_pipeline_notifications
}

resource "ibm_cd_tekton_pipeline_definition" "ci_pipeline_definition" {
  count       = ((var.pipeline_git_tag == "") && (var.add_pipeline_definitions)) ? 1 : 0
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  source {
    type = "git"
    properties {
      url    = var.pipeline_repo_url
      branch = var.ci_pipeline_branch
      path   = var.pipeline_path
    }
  }
}

resource "ibm_cd_tekton_pipeline_definition" "cd_tekton_definition_tag" {
  count       = ((var.pipeline_git_tag != "") && (var.add_pipeline_definitions)) ? 1 : 0
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  source {
    type = "git"
    properties {
      tag  = var.pipeline_git_tag
      path = var.pipeline_path
      url  = var.pipeline_repo_url
    }
  }
}

############ GIT Trigger #############################################

resource "ibm_cd_tekton_pipeline_trigger" "ci_pipeline_scm_trigger" {
  count       = (var.create_git_triggers && var.enable_app_repo_integration) ? 1 : 0
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  type        = "scm"
  name        = var.trigger_git_name
  event_listener = ((var.app_repo_provider_webhook_syntax == "github") ?
  "ci-listener" : "ci-listener-gitlab")
  events  = ["push"]
  enabled = var.trigger_git_enable
  source {
    type = "git"
    properties {
      url    = var.app_repo_url
      branch = var.app_repo_branch
    }
  }
  max_concurrent_runs = var.ci_pipeline_max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_scm_trigger_property_app_name" {
  count       = (var.create_git_triggers && var.enable_app_repo_integration) ? 1 : 0
  name        = "app-name"
  type        = "text"
  value       = var.app_name
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.ci_pipeline_scm_trigger[0].trigger_id
}

########### Timed Trigger ###################################################

resource "ibm_cd_tekton_pipeline_trigger" "ci_pipeline_timed_trigger" {
  count       = (var.create_triggers && var.enable_app_repo_integration) ? 1 : 0
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  type        = "timer"
  name        = var.trigger_timed_name
  event_listener = ((var.app_repo_provider_webhook_syntax == "github") ?
  "ci-listener" : "ci-listener-gitlab")
  cron                = var.trigger_timed_cron_schedule
  timezone            = "UTC"
  enabled             = var.trigger_timed_enable
  max_concurrent_runs = var.ci_pipeline_max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_timed_trigger_property_app_name" {
  count       = (var.create_triggers && var.enable_app_repo_integration) ? 1 : 0
  name        = "app-name"
  type        = "text"
  value       = var.app_name
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.ci_pipeline_timed_trigger[0].trigger_id
}

############ Manual Trigger ################################################

resource "ibm_cd_tekton_pipeline_trigger" "ci_pipeline_manual_trigger" {
  count       = (var.create_triggers && var.enable_app_repo_integration) ? 1 : 0
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  type        = "manual"
  name        = var.trigger_manual_name
  event_listener = ((var.app_repo_provider_webhook_syntax == "github") ?
  "ci-listener" : "ci-listener-gitlab")
  enabled             = var.trigger_manual_enable
  max_concurrent_runs = var.ci_pipeline_max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_manual_trigger_property_app_name" {
  count       = (var.create_triggers && var.enable_app_repo_integration) ? 1 : 0
  name        = "app-name"
  type        = "text"
  value       = var.app_name
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.ci_pipeline_manual_trigger[0].trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_manual_trigger_property_repository" {
  count       = (var.create_triggers && var.enable_app_repo_integration) ? 1 : 0
  name        = "repository"
  type        = "text"
  value       = var.app_repo_url
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.ci_pipeline_manual_trigger[0].trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_manual_trigger_property_branch" {
  count       = (var.create_triggers && var.enable_app_repo_integration) ? 1 : 0
  name        = "branch"
  type        = "text"
  value       = var.app_repo_branch
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.ci_pipeline_manual_trigger[0].trigger_id
}
