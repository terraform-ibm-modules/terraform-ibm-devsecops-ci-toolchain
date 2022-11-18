resource "ibm_cd_tekton_pipeline" "pr_pipeline_instance" {
  pipeline_id = var.pipeline_id
  worker {
    id = "public"
  }
}

resource "ibm_cd_tekton_pipeline_definition" "pr_pipeline_definition" {
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
  source {
    type = "git"
    properties {
      url     = var.pipeline_repo
      branch  = var.pipeline_branch
      path    = var.pipeline_path
    }
  }
}

resource "ibm_cd_tekton_pipeline_trigger" "pr_pipeline_scm_trigger" {
  pipeline_id    = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
  type           = var.pr_pipeline_scm_trigger_type
  name           = var.pr_pipeline_scm_trigger_name
  event_listener = var.pr_pipeline_scm_trigger_listener_name
  events         = ["push", "pull_request_closed", "pull_request"]
  source {
    type = "git"
    properties {
      url    = var.app_repo
      branch = "master"
    }
  }
  max_concurrent_runs = var.pr_pipeline_max_concurrent_runs
}
