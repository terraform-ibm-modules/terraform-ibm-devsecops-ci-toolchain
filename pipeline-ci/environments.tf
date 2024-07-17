resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_config_branch" {
  name        = "pipeline-config-branch"
  type        = "text"
  value       = var.pipeline_config_repo_branch
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_config_repo" {
  count       = (var.pipeline_config_repo_existing_url == "") && (var.pipeline_config_repo_clone_from_url == "") ? 0 : 1
  name        = "pipeline-config-repo"
  type        = "integration"
  value       = try(var.pipeline_config_repo.tool_id, "")
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_config_repo_default" {
  count       = (var.pipeline_config_repo_existing_url == "") && (var.pipeline_config_repo_clone_from_url == "") ? 1 : 0
  name        = "pipeline-config-repo"
  type        = "text"
  value       = try(var.pipeline_config_repo.tool_id, "")
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_event_notifications" {
  type        = "text"
  name        = "event-notifications"
  value       = var.event_notifications
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_ibmcloud_api_key" {
  name        = "ibmcloud-api-key"
  type        = "secure"
  value       = var.pipeline_ibmcloud_api_key_secret_ref
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_evidence_repo" {
  name        = "evidence-repo"
  type        = "integration"
  value       = var.evidence_repo.tool_id
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_inventory_repo" {
  name        = "inventory-repo"
  type        = "integration"
  value       = var.inventory_repo.tool_id
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

// Limitation with issues repository url: How to fetch issues repository url
// as it is created internally while creating application repository resource
resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_issues_repo" {
  name        = "incident-repo"
  type        = "integration"
  value       = var.issues_repo.tool_id
  path        = "parameters.repo_url"
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_dev_region" {
  name        = "dev-region"
  type        = "text"
  value       = var.dev_region
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_registry_region" {
  name        = "registry-region"
  type        = "text"
  value       = var.registry_region
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_cos_api_key_secret_name" {
  name        = "cos-api-key"
  type        = "secure"
  value       = var.cos_api_key_secret_ref
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_doi_api_key" {
  count       = var.link_to_doi_toolchain ? 1 : 0
  name        = "doi-ibmcloud-api-key"
  type        = "secure"
  value       = var.pipeline_doi_api_key_secret_ref
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_app_name" {
  name        = "app-name"
  type        = "text"
  value       = var.app_name
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_sonarqube" {
  count       = (var.sonarqube_config == "custom") ? 1 : 0
  name        = "sonarqube"
  type        = "integration"
  value       = try(var.sonarqube_tool, "")
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_sonarqube-config" {
  name        = "sonarqube-config"
  type        = "text"
  value       = var.sonarqube_config
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

######## Code Engine Vars #####################

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_code_engine_project" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "code-engine-project"
  type        = "text"
  value       = var.code_engine_project
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_code_engine_region" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "code-engine-region"
  type        = "text"
  value       = var.code_engine_region
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_code_engine_resource_group" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "code-engine-resource-group"
  type        = "text"
  value       = var.code_engine_resource_group
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_artifactory-dockerconfigjson" {
  name        = "artifactory-dockerconfigjson"
  count       = (var.enable_artifactory) ? 1 : 0
  type        = "integration"
  value       = var.tool_artifactory
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
  path        = "parameters.docker_config_json"
}
