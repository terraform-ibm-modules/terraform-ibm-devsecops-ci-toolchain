resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_pipeline_config_repo" {
  count       = (var.pipeline_config_repo_existing_url == "") && (var.pipeline_config_repo_clone_from_url == "") ? 0 : 1
  name        = "pipeline-config-repo"
  type        = "integration"
  value       = try(var.pipeline_config_repo.tool_id, "")
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties,"pipeline-config-repo") ? "true" : "false"
}

resource "ibm_cd_tekton_pipeline_property" "pr_pipeline_pipeline_config_repo_default" {
  count       = (var.pipeline_config_repo_existing_url == "") && (var.pipeline_config_repo_clone_from_url == "") ? 1 : 0
  name        = "pipeline-config-repo"
  type        = "text"
  value       = try(var.pipeline_config_repo.tool_id, "")
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties,"pipeline-config-repo") ? "true" : "false"
}

resource "ibm_cd_tekton_pipeline_property" "artifactory-dockerconfigjson" {
  name        = "artifactory-dockerconfigjson"
  count       = (var.enable_artifactory) ? 1 : 0
  type        = "integration"
  value       = var.tool_artifactory
  pipeline_id = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
  path        = "parameters.docker_config_json"
  locked      = contains(var.default_locked_properties,"artifactory-dockerconfigjson") ? "true" : "false"
}
