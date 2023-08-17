resource "ibm_cd_tekton_pipeline" "ci_pipeline_instance" {
  pipeline_id = var.pipeline_id
  worker {
    id = var.private_worker
  }
  enable_notifications = var.enable_pipeline_notifications
}

resource "ibm_cd_tekton_pipeline_definition" "ci_pipeline_definition" {
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

############ GIT Trigger #############################################

resource "ibm_cd_tekton_pipeline_trigger" "ci_pipeline_scm_trigger" {
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
  name        = "app-name"
  type        = "text"
  value       = var.app_name
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.ci_pipeline_scm_trigger.trigger_id
}

########### Timed Trigger ###################################################

resource "ibm_cd_tekton_pipeline_trigger" "ci_pipeline_timed_trigger" {
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
  name        = "app-name"
  type        = "text"
  value       = var.app_name
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.ci_pipeline_timed_trigger.trigger_id
}

############ Manual Trigger ################################################

resource "ibm_cd_tekton_pipeline_trigger" "ci_pipeline_manual_trigger" {
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  type        = "manual"
  name        = var.trigger_manual_name
  event_listener = ((var.app_repo_provider_webhook_syntax == "github") ?
  "ci-listener" : "ci-listener-gitlab")
  enabled             = var.trigger_manual_enable
  max_concurrent_runs = var.ci_pipeline_max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_manual_trigger_property_app_name" {
  name        = "app-name"
  type        = "text"
  value       = var.app_name
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.ci_pipeline_manual_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_manual_trigger_property_repository" {
  name        = "repository"
  type        = "text"
  value       = var.app_repo_url
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.ci_pipeline_manual_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_manual_trigger_property_branch" {
  name        = "branch"
  type        = "text"
  value       = var.app_repo_branch
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.ci_pipeline_manual_trigger.trigger_id
}



############ Pruner Triggers   #############################
resource "ibm_cd_tekton_pipeline_trigger" "ci_pipeline_manual_pruner_trigger" {
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  type           = "manual"
  name           = var.trigger_manual_pruner_name
  event_listener = "prune-evidence-listener"
  enabled        = var.trigger_manual_pruner_enable #true
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_manual_pruner_trigger_property_batch" {
  name        = "evidence-pruner-batch-size"
  type        = "text"
  value       = "1000"
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.ci_pipeline_manual_pruner_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_manual_pruner_trigger_property_branch" {
  name        = "evidence-pruner-branch"
  type        = "text"
  value       = "chore/prune-evidences"
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.ci_pipeline_manual_pruner_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_manual_pruner_trigger_property_retention" {
  name        = "evidence-retention-days"
  type        = "text"
  value       = ""
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.ci_pipeline_manual_pruner_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_manual_pruner_trigger_property_v1" {
  name        = "opt-in-v1-evidence-pruner"
  type        = "single_select"
  enum        = ["0", "1"]
  value       = "0"
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.ci_pipeline_manual_pruner_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_manual_pruner_trigger_property_v2" {
  name        = "opt-in-v2-evidence-pruner"
  type        = "single_select"
  enum        = ["0", "1"]
  value       = "0"
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.ci_pipeline_manual_pruner_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger" "ci_pipeline_timed_pruner_trigger" {
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  type           = "timer"
  name           = var.trigger_timed_pruner_name
  event_listener = "prune-evidence-listener"
  cron           = "0 2 * * *"
  timezone       = "UTC"
  enabled        = var.trigger_timed_pruner_enable #false
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_timed_pruner_trigger_property_batch" {
  name        = "evidence-pruner-batch-size"
  type        = "text"
  value       = "1000"
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.ci_pipeline_timed_pruner_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_timed_pruner_trigger_property_branch" {
  name        = "evidence-pruner-branch"
  type        = "text"
  value       = "chore/prune-evidences"
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.ci_pipeline_timed_pruner_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_timed_pruner_trigger_property_retention" {
  name        = "evidence-retention-days"
  type        = "text"
  value       = "365"
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.ci_pipeline_timed_pruner_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_timed_pruner_trigger_property_v1" {
  name        = "opt-in-v1-evidence-pruner"
  type        = "single_select"
  enum        = ["0", "1"]
  value       = "0"
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.ci_pipeline_timed_pruner_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_timed_pruner_trigger_property_v2" {
  name        = "opt-in-v2-evidence-pruner"
  type        = "single_select"
  enum        = ["0", "1"]
  value       = "0"
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.ci_pipeline_timed_pruner_trigger.trigger_id
}

output "pipeline_id" {
  value = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}
