resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_config" {
  name           = "pipeline-config"
  type           = "text"
  value          = var.pipeline_config_path
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_config_branch" {
  name           = "pipeline-config-branch"
  type           = "text"
  value          = var.pipeline_config_repo_branch
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_config_repo" {
  count          = (var.pipeline_config_repo_existing_url == "") ? 0 : 1 
  name           = "pipeline-config-repo"
  type           = "integration"
  value          = try(var.pipeline_config_repo[0].tool_id, "")
  path           = "parameters.repo_url"
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_config_repo_default" {
  count          = (var.pipeline_config_repo_existing_url == "") ? 1 : 0 
  name           = "pipeline-config-repo"
  type           = "text"
  value          = try(var.pipeline_config_repo[0].tool_id, "")
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_debug" {
  name           = "pipeline-debug"
  type           = "text"
  value          = "0"
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

# resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_dockerconfigjson" {
#   name           = "pipeline-dockerconfigjson"
#   type           = "secure"
#   value          = ""
#   pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
# }

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_slack_notifications" {
  name           = "slack-notifications"
  type           = "text"
  value          = "0"
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_ibmcloud_api_key" {
  name           = "ibmcloud-api-key"
  type           = "secure"
  value          = format("{vault::%s.${var.pipeline_ibmcloud_api_key_secret_name}}", var.secret_tool)
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_evidence_repo" {
  name           = "evidence-repo"
  type           = "integration"
  value          = var.evidence_repo.tool_id
  path           = "parameters.repo_url"
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_inventory_repo" {
  name           = "inventory-repo"
  type           = "integration"
  value          = var.inventory_repo.tool_id
  path           = "parameters.repo_url"
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

// Limitation with issues repository url: How to fetch issues repository url
// as it is created internally while creating application repository resource
resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_issues_repo" {
  name           = "incident-repo"
  type           = "integration"
  value          = var.issues_repo.tool_id
  path           = "parameters.repo_url"
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_cluster_name" {
  count          = (var.deployment_target != "code-engine") ? 1:0
  name           = "cluster-name"
  type           = "text"
  value          = var.cluster_name
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_dev_cluster_namespace" {
  count          = (var.deployment_target != "code-engine") ? 1:0
  name           = "dev-cluster-namespace"
  type           = "text"
  value          = var.cluster_namespace
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_dev_region" {
  name           = "dev-region"
  type           = "text"
  value          = var.dev_region
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_dev_resource_group" {
  name           = "dev-resource-group"
  type           = "text"
  value          = var.dev_resource_group
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_registry_namespace" {
  name           = "registry-namespace"
  type           = "text"
  value          = var.registry_namespace
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_registry_region" {
  name           = "registry-region"
  type           = "text"
  value          = var.registry_region
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_cos_api_key_secret_name" {
  name           = "cos-api-key"
  type           = "secure"
  value          = format("{vault::%s.${var.cos_api_key_secret_name}}", var.secret_tool)
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_cos_bucket_name" {
  name           = "cos-bucket-name"
  type           = "text"
  value          = var.cos_bucket_name
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_cos_endpoint" {
  name           = "cos-endpoint"
  type           = "text"
  value          = var.cos_endpoint
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_dynamic_api_environment" {
  name           = "opt-in-dynamic-api-scan"
  type           = "text"
  value          = "1"
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_dynamic_ui_environment" {
  name           = "opt-in-dynamic-ui-scan"
  type           = "text"
  value          = "1"
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_dynamic_environment" {
  name           = "opt-in-dynamic-scan"
  type           = "text"
  value          = "1"
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_opt_out_v1_evidence" {
  name           = "opt_out_v1_evidence"
  type           = "text"
  value          = "1"
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_sonar_environment" {
  name           = "opt-in-sonar"
  type           = "text"
  value          = "1"
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_git_token_environment" {
  name           = "git-token"
  type           = "secure"
  value          = ""
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_doi_environment" {
  name           = "doi-environment"
  type           = "text"
  value          = ""
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_doi_toolchain_id" {
  name           = "doi-toolchain-id"
  type           = "text"
  value          = ""
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_cra_generate_cyclonedx_format" {
  name           = "cra-generate-cyclonedx-format"
  type           = "text"
  value          = "1"
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_custom_image_tag" {
  name           = "custom-image-tag"
  type           = "text"
  value          = ""
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id       
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_version" {
   name           = "version"
   type           = "text"
   value          = "v1"
   pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_signing_key_secret_name" {
  name           = "signing-key"
  type           = "secure"
  value          = format("{vault::%s.${var.signing_key_secret_name}}", var.secret_tool)
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_app_name" {
  name           = "app-name"
  type           = "text"
  value          = var.app_name
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_ibm_cloud_api" {
  name           = "ibmcloud-api"
  type           = "text"
  value          = var.ibm_cloud_api
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_sonarqube" {
  name           = "sonarqube"
  type           = "text"
  value          = "{}"
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_sonarqube-config" {
  name           = "sonarqube-config"
  type           = "text"
  value          = "default"
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

# resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_sonarqube" {
#   name           = "sonarqube"
#   type           = "INTEGRATION"
#   integration_id = ""
#   pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
# }

######## Deployment Strategy ##################

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_deployment_target" {
  count          = (var.deployment_target == "code-engine") ? 1:0
  name           = "deployment-target"
  type           = "text"
  value          = var.deployment_target
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

######## Code Engine Vars #####################

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_code_engine_project" {
  count          = (var.deployment_target == "code-engine") ? 1:0
  name           = "code-engine-project"
  type           = "text"
  value          = var.code_engine_project
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_code_engine_region" {
  count          = (var.deployment_target == "code-engine") ? 1:0
  name           = "code-engine-region"
  type           = "text"
  value          = var.code_engine_region
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_code_engine_resource_group" {
  count          = (var.deployment_target == "code-engine") ? 1:0
  name           = "code-engine-resource-group"
  type           = "text"
  value          = var.code_engine_resource_group
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_code_engine_entity_type" {
  count          = (var.deployment_target == "code-engine") ? 1:0
  name           = "code-engine-entity-type"
  type           = "text"
  value          = var.code_engine_entity_type
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_code_engine_build_strategy" {
  count          = (var.deployment_target == "code-engine") ? 1:0
  name           = "code-engine-build-strategy"
  type           = "text"
  value          = var.code_engine_build_strategy
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_code_engine_source" {
  count          = (var.deployment_target == "code-engine") ? 1:0
  name           = "source"
  type           = "text"
  value          = var.code_engine_source
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_base_image" {
  count          = (var.compliance_base_image == "") ? 0:1
  name           = "compliance-baseimage"
  type           = "text"
  value          = var.compliance_base_image
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}
