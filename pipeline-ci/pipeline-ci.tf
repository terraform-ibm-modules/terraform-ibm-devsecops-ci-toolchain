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
      url    = var.pipeline_repo
      branch = var.pipeline_branch
      path   = var.pipeline_path
    }
  }
}

resource "ibm_cd_tekton_pipeline_trigger" "ci_pipeline_manual_trigger" {
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  type           = var.ci_pipeline_manual_trigger_type
  name           = var.ci_pipeline_manual_trigger_name
  event_listener = var.ci_pipeline_manual_trigger_listener_name
  enabled        = true
  max_concurrent_runs = var.ci_pipeline_max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger" "ci_pipeline_scm_trigger" {
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  type           = var.ci_pipeline_scm_trigger_type
  name           = var.ci_pipeline_scm_trigger_name
  event_listener = var.ci_pipeline_scm_trigger_listener_name
  events         = ["push"]
  enabled        = true
  source {
    type = "git"
    properties {
      url    = var.app_repo
      branch = "master"
    }
  }
  max_concurrent_runs = var.ci_pipeline_max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger" "ci_pipeline_timed_trigger" {
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  type           = var.ci_pipeline_timed_trigger_type
  name           = var.ci_pipeline_timed_trigger_name
  event_listener = var.ci_pipeline_timed_trigger_listener_name
  cron           = "0 4 * * *"
  timezone       = "UTC"
  enabled        = false
  max_concurrent_runs = var.ci_pipeline_max_concurrent_runs
}
