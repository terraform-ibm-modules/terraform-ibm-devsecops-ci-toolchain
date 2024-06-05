resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_ibmcloud_api_key" {
  name        = "ibmcloud-api-key"
  type        = "secure"
  value       = var.pipeline_ibmcloud_api_key_secret_ref
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_pipeline_config" {
  name        = "pipeline-config"
  type        = "text"
  value       = var.pipeline_config_path
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_pipeline_config_branch" {
  name        = "pipeline-config-branch"
  type        = "text"
  value       = var.pipeline_config_repo_branch
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_pipeline_config_repo" {
  count       = (var.pipeline_config_repo_existing_url == "") && (var.pipeline_config_repo_clone_from_url == "") ? 0 : 1
  name        = "pipeline-config-repo"
  type        = "integration"
  value       = try(var.pipeline_config_repo.tool_id, "")
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_pipeline_config_repo_default" {
  count       = (var.pipeline_config_repo_existing_url == "") && (var.pipeline_config_repo_clone_from_url == "") ? 1 : 0
  name        = "pipeline-config-repo"
  type        = "text"
  value       = try(var.pipeline_config_repo.tool_id, "")
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_pipeline_debug" {
  name        = "pipeline-debug"
  type        = "single_select"
  enum        = ["0", "1"]
  value       = var.pipeline_debug
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_slack_notifications" {
  name        = "slack-notifications"
  type        = "text"
  value       = var.slack_notifications
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_ibm_cloud_api" {
  name        = "ibmcloud-api"
  type        = "text"
  value       = var.ibmcloud_api
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_git-token" {
  count       = (var.enable_pipeline_git_token) ? 1 : 0
  name        = "git-token"
  type        = "secure"
  value       = var.pipeline_git_token_secret_ref
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_base_image" {
  count       = (var.compliance_base_image == "") ? 0 : 1
  name        = "compliance-baseimage"
  type        = "text"
  value       = var.compliance_base_image
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_dockerjson_config" {
  count       = (var.enable_pipeline_dockerconfigjson) ? 1 : 0
  name        = "pipeline-dockerconfigjson"
  type        = "secure"
  value       = var.pipeline_dockerconfigjson_secret_ref
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "artifactory-dockerconfigjson" {
  name        = "artifactory-dockerconfigjson"
  count       = (var.enable_artifactory) ? 1 : 0
  type        = "integration"
  value       = var.tool_artifactory
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
  path        = "parameters.docker_config_json"

}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_zos_host_name" {
  count       = (var.deployment_target == "zos") ? 1 : 0
  name        = "zos-hostname"
  type        = "text"
  value       = var.zos_host_name
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_zos_ssh_port" {
  count       = (var.deployment_target == "zos") ? 1 : 0
  name        = "zos-ssh-port"
  type        = "text"
  value       = var.zos_ssh_port
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_zos_user" {
  count       = (var.deployment_target == "zos") ? 1 : 0
  name        = "zos-user"
  type        = "text"
  value       = var.zos_user
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_zos_dbb_hlq" {
  count       = (var.deployment_target == "zos") ? 1 : 0
  name        = "dbb-hlq"
  type        = "text"
  value       = var.zos_dbb_hlq
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_zos_dbb_user" {
  count       = (var.deployment_target == "zos") ? 1 : 0
  name        = "dbb-user"
  type        = "text"
  value       = var.zos_dbb_user
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_zos_secret_key_name" {
  count       = (var.deployment_target == "zos") ? 1 : 0
  name        = "zos-secret-key-name"
  type        = "secure"
  value       = var.zos_secret_key_name
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}
