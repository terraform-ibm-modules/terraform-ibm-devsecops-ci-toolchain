resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_ibmcloud_api_key" {
  name           = "ibmcloud-api-key"
  type           = "secure"
  value          = format("{vault::%s.%s.ibmcloud-api-key}", var.sm_integration_name, var.sm_group)
  pipeline_id    = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_pipeline_config" {
  name           = "pipeline-config"
  type           = "text"
  value          = ".pipeline-config.yaml"
  pipeline_id    = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_pipeline_config_branch" {
  name           = "pipeline-config-branch"
  type           = "text"
  value          = "master"
  pipeline_id    = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_pipeline_config_repo" {
  name           = "pipeline-config-repo"
  type           = "text"
  value          = ""
  pipeline_id    = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_pipeline_debug" {
  name           = "pipeline-debug"
  type           = "text"
  value          = "0"
  pipeline_id    = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_slack_notifications" {
  name           = "slack-notifications"
  type           = "text"
  value          = "1"
  pipeline_id    = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_ibm_cloud_api" {
  name           = "ibmcloud-api"
  type           = "text"
  value          = var.ibm_cloud_api
  pipeline_id    = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_git-token" {
  name           = "git-token"
  type           = "text"
  value          = ""
  pipeline_id    = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}