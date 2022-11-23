resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_config" {
  name           = "pipeline-config"
  type           = "text"
  value          = ".pipeline-config.yaml"
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_config_branch" {
  name           = "pipeline-config-branch"
  type           = "text"
  value          = "master"
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_config_repo" {
  name           = "pipeline-config-repo"
  type           = "text"
  value          = ""
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
  value          = format("{vault::%s.ibmcloud-api-key}", var.secret_tool)
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_evidence_repo" {
  name           = "evidence-repo"
  type           = "text"
  value          = var.evidence_repo
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_inventory_repo" {
  name           = "inventory-repo"
  type           = "text"
  value          = var.inventory_repo
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

// Limitation with issues repository url: How to fetch issues repository url
// as it is created internally while creating application repository resource
resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_issues_repo" {
  name           = "incident-repo"
  type           = "text"
  value          = var.issues_repo
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_cluster_name" {
  name           = "cluster-name"
  type           = "text"
  value          = var.cluster_name
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_dev_cluster_namespace" {
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

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_cos_api_key" {
  name           = "cos-api-key"
  type           = "secure"
  value          = format("{vault::%s.cos-api-key}", var.secret_tool)
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
  type           = "text"
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

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_signing_key" {
  name           = "signing-key"
  type           = "secure"
  value          = format("{vault::%s.signing-key}", var.secret_tool)
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