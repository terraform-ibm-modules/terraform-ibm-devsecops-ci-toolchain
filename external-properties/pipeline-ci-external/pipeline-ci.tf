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

resource "ibm_cd_tekton_pipeline_definition" "external_properties_base_definition" {
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  source {
    type = "git"
    properties {
      url    = var.external_properties_repo_url
      branch = var.external_properties_branch
      path   = "${var.external_properties_path}/ci/base"
    }
  }
}

resource "ibm_cd_tekton_pipeline_definition" "external_properties_ci_trigger_definition" {
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  source {
    type = "git"
    properties {
      url    = var.external_properties_repo_url
      branch = var.external_properties_branch
      path   = "${var.external_properties_path}/ci/triggers/git-ci-trigger"
    }
  }
}

resource "ibm_cd_tekton_pipeline_definition" "external_properties_timed_trigger_definition" {
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  source {
    type = "git"
    properties {
      url    = var.external_properties_repo_url
      branch = var.external_properties_branch
      path   = "${var.external_properties_path}/ci/triggers/git-ci-timed-trigger"
    }
  }
}

resource "ibm_cd_tekton_pipeline_definition" "external_properties_manual_trigger_definition" {
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  source {
    type = "git"
    properties {
      url    = var.external_properties_repo_url
      branch = var.external_properties_branch
      path   = "${var.external_properties_path}/ci/triggers/manual-trigger"
    }
  }
}

resource "ibm_cd_tekton_pipeline_trigger" "ci_pipeline_scm_trigger" {
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  type           = "scm"
  name           = "Git CI Trigger"
  event_listener = ((var.app_repo_provider_webhook_syntax == "github")? 
                    "ci-listener" : "ci-listener-gitlab")
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
  event_listener = ((var.app_repo_provider_webhook_syntax == "github")? 
                  "ci-listener" : "ci-listener-gitlab")
  cron           = "0 4 * * *"
  timezone       = "UTC"
  enabled        = false
  max_concurrent_runs = var.ci_pipeline_max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger" "ci_pipeline_manual_trigger" {
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  type           = "manual"
  name           = "Manual Trigger"
  event_listener = ((var.app_repo_provider_webhook_syntax == "github")? 
                  "ci-listener" : "ci-listener-gitlab")
  enabled        = true
  max_concurrent_runs = var.ci_pipeline_max_concurrent_runs
}

output "pipeline_id" {
  value = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}