resource "ibm_cd_tekton_pipeline" "pr_pipeline_instance" {
  pipeline_id = var.pipeline_id
  worker {
    id = "public"
  }
}

resource "ibm_cd_tekton_pipeline_definition" "pr_pipeline_definition" {
  pipeline_id     = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
  scm_source {
    url           = var.pipeline_repo
    branch        = var.pipeline_branch
    path          = var.pipeline_path
  }
}

resource "ibm_cd_tekton_pipeline_trigger" "pr_pipeline_scm_trigger" {
  pipeline_id       = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
  trigger {
    type            = var.pr_pipeline_scm_trigger_type
    name            = var.pr_pipeline_scm_trigger_name
    event_listener  = var.pr_pipeline_scm_trigger_listener_name
    scm_source {
      url     = var.app_repo
      branch  = "master"
    }
    events {
      push                = true
      pull_request_closed = true
      pull_request        = true
    } 
    concurrency {
      max_concurrent_runs = var.pr_pipeline_max_concurrent_runs
    }
  }
}