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
      url    = var.pipeline_repo_url
      branch = var.pr_pipeline_branch
      path   = var.pipeline_path
    }
  }
}

resource "ibm_cd_tekton_pipeline_trigger" "pr_pipeline_scm_trigger" {
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
  type        = "scm"
  name        = var.trigger_pr_git_name
  event_listener = ((var.app_repo_provider_webhook_syntax == "github") ?
  "pr-listener" : "pr-listener-gitlab")
  enabled = var.trigger_pr_git_enable
  events = ["pull_request"]
  source {
    type = "git"
    properties {
      url    = var.app_repo_url
      branch = var.app_repo_branch
    }
  }
  max_concurrent_runs = var.pr_pipeline_max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger_property" "pr_pipeline_scm_trigger_property_app_name" {
  name        = "app-name"
  type        = "text"
  value       = var.app_name
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
  trigger_id  = ibm_cd_tekton_pipeline_trigger.pr_pipeline_scm_trigger.trigger_id
}

output "pipeline_id" {
  value = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}
