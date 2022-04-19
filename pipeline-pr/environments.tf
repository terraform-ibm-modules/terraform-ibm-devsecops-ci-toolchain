resource "ibm_tekton_pipeline_property" "pr_pipeline_ibmcloud_api_key" {
  name           = "ibmcloud-api-key"
  type           = "SECURE"
  value          = format("{vault::%s.ibmcloud-api-key}", var.kp_integration_name)
  pipeline_id    = var.pipeline_id          
}

resource "ibm_tekton_pipeline_property" "pr_pipeline_pipeline_config" {
  name           = "pipeline-config"
  type           = "TEXT"
  value          = ".pipeline-config.yaml"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_tekton_pipeline_property" "pr_pipeline_pipeline_config_branch" {
  name           = "pipeline-config-branch"
  type           = "TEXT"
  value          = "master"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_tekton_pipeline_property" "pr_pipeline_pipeline_config_repo" {
  name           = "pipeline-config-repo"
  type           = "TEXT"
  value          = " "
  pipeline_id    = ibm_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_tekton_pipeline_property" "pr_pipeline_pipeline_debug" {
  name           = "pipeline-debug"
  type           = "TEXT"
  value          = "0"
  pipeline_id    = ibm_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_tekton_pipeline_property" "pr_pipeline_slack_notifications" {
  name           = "slack-notifications"
  type           = "TEXT"
  value          = "1"
  pipeline_id    = ibm_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_tekton_pipeline_property" "pr_pipeline_ibm_cloud_api" {
  name           = "ibmcloud-api"
  type           = "TEXT"
  value          = var.ibm_cloud_api
  pipeline_id    = var.pipeline_id          
}