resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_config_repo" {
  count       = (var.pipeline_config_repo_existing_url == "") && (var.pipeline_config_repo_clone_from_url == "") ? 0 : 1
  name        = "pipeline-config-repo"
  type        = "integration"
  value       = try(var.pipeline_config_repo.tool_id, "")
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties,"pipeline-config-repo") ? "true" : "false"
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_config_repo_default" {
  count       = (var.pipeline_config_repo_existing_url == "") && (var.pipeline_config_repo_clone_from_url == "") ? 1 : 0
  name        = "pipeline-config-repo"
  type        = "text"
  value       = try(var.pipeline_config_repo.tool_id, "")
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties,"pipeline-config-repo") ? "true" : "false"
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_evidence_repo" {
  name        = "evidence-repo"
  type        = "integration"
  value       = var.evidence_repo.tool_id
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties,"evidence-repo") ? "true" : "false"
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_inventory_repo" {
  name        = "inventory-repo"
  type        = "integration"
  value       = var.inventory_repo.tool_id
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties,"inventory-repo") ? "true" : "false"
}

// Limitation with issues repository url: How to fetch issues repository url
// as it is created internally while creating application repository resource
resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_issues_repo" {
  name        = "incident-repo"
  type        = "integration"
  value       = var.issues_repo.tool_id
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties,"incident-repo") ? "true" : "false"
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_doi_api_key" {
  count       = var.link_to_doi_toolchain ? 1 : 0
  name        = "doi-ibmcloud-api-key"
  type        = "secure"
  value       = var.pipeline_doi_api_key_secret_ref
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties,"doi-ibmcloud-api-key") ? "true" : "false"
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_app_name" {
  name        = "app-name"
  type        = "text"
  value       = var.app_name
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties,"app-name") ? "true" : "false"
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_sonarqube" {
  count       = (var.sonarqube_user != "") ? 1 : 0
  name        = "sonarqube"
  type        = "integration"
  value       = try(var.sonarqube_tool, "")
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  locked      = contains(var.default_locked_properties,"sonarqube") ? "true" : "false"
}

resource "ibm_cd_tekton_pipeline_property" "ci_artifactory-dockerconfigjson" {
  name        = "artifactory-dockerconfigjson"
  count       = (var.enable_artifactory) ? 1 : 0
  type        = "integration"
  value       = var.tool_artifactory
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  path        = "parameters.docker_config_json"
  locked      = contains(var.default_locked_properties,"artifactory-dockerconfigjson") ? "true" : "false"
}
