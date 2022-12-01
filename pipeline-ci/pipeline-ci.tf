resource "ibm_cd_tekton_pipeline" "ci_pipeline_instance" {
  pipeline_id = var.pipeline_id
  worker {
    id = "public"
  }
}

resource "ibm_cd_tekton_pipeline_definition" "ci_pipeline_definition" {
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  source {
    type = "git"
    properties {
      url    = var.pipeline_repo_url
      branch = var.pipeline_branch
      path   = var.pipeline_path
    }
  }
}

resource "ibm_cd_tekton_pipeline_trigger" "ci_pipeline_scm_trigger" {
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  type           = "scm"
  name           = "Git CI Trigger"
  event_listener = "ci-listener-gitlab"
  events         = ["push"]
  enabled        = true
  source {
    type = "git"
    properties {
      url    = var.app_repo_url
      branch = var.app_repo_branch
    }
  }
  max_concurrent_runs = var.ci_pipeline_max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger" "ci_pipeline_timed_trigger" {
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  type           = "timer"
  name           = "Git CI Timed Trigger"
  event_listener = "ci-listener-gitlab"
  cron           = "0 4 * * *"
  timezone       = "UTC"
  enabled        = false
  max_concurrent_runs = var.ci_pipeline_max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger" "ci_pipeline_manual_trigger" {
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  type           = "manual"
  name           = "Manual Trigger"
  event_listener = "ci-listener-gitlab"
  enabled        = true
  max_concurrent_runs = var.ci_pipeline_max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_manual_trigger_property_app_name" {
   name           = "app-name"
   type           = "text"
   value          = "hello-compliance-app"
   pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
   trigger_id     = ibm_cd_tekton_pipeline_trigger.ci_pipeline_manual_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_manual_trigger_property_repository" {
   name           = "repository"
   type           = "text"
   value          = var.app_repo_url
   pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
   trigger_id     = ibm_cd_tekton_pipeline_trigger.ci_pipeline_manual_trigger.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_manual_trigger_property_branch" {
   name           = "branch"
   type           = "text"
   value          = var.app_repo_branch
   pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
   trigger_id     = ibm_cd_tekton_pipeline_trigger.ci_pipeline_manual_trigger.trigger_id
}

output "pipeline_id" {
  value = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}