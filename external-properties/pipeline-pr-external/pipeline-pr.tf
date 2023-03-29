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
      url     = var.pipeline_repo_url
      branch  = var.pipeline_branch
      path    = var.pipeline_path
    }
  }
}

resource "ibm_cd_tekton_pipeline_definition" "external_properties_definition" {
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
  source {
    type = "git"
    properties {
      url    = var.external_properties_repo_url
      branch = var.external_properties_branch
      path   = "${var.external_properties_path}/pr/base"
      #  path   = var.external_properties_pr_base_path
    }
  }
}

resource "ibm_cd_tekton_pipeline_trigger" "pr_pipeline_scm_trigger" {
  pipeline_id    = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
  type           = "scm"
  name           = "Git PR Trigger"
  event_listener = ((var.app_repo_provider_webhook_syntax == "github")? 
                      "pr-listener" : "pr-listener-gitlab")
  events         = ["pull_request"]
  source {
    type = "git"
    properties {
      url    = var.app_repo_url
      branch = var.app_repo_branch
    }
  }
  max_concurrent_runs = var.pr_pipeline_max_concurrent_runs
}

output "pipeline_id" {
  value = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}
