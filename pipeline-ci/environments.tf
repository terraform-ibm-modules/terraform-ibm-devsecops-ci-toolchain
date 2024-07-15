resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_config" {
  name        = "pipeline-config"
  type        = "text"
  value       = var.pipeline_config_path
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

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

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_debug" {
  name        = "pipeline-debug"
  type        = "single_select"
  enum        = ["0", "1"]
  value       = var.pipeline_debug
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_print_signing_cert" {
  count       = (var.print_code_signing_certificate != "") ? 1 : 0
  name        = "print-code-signing-certificate"
  type        = "text"
  value       = var.print_code_signing_certificate
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

# resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_dockerconfigjson" {
#   name           = "pipeline-dockerconfigjson"
#   type           = "secure"
#   value          = ""
#   pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
# }

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_event_notifications" {
  type        = "text"
  name        = "event-notifications"
  value       = var.event_notifications
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_slack_notifications" {
  name        = "slack-notifications"
  type        = "text"
  value       = var.slack_notifications
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

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_registry_namespace" {
  name        = "registry-namespace"
  type        = "text"
  value       = var.registry_namespace
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

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_cos_bucket_name" {
  name        = "cos-bucket-name"
  type        = "text"
  value       = var.cos_bucket_name
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_cos_endpoint" {
  name        = "cos-endpoint"
  type        = "text"
  value       = var.cos_endpoint
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_dynamic_api_environment" {
  name        = "opt-in-dynamic-api-scan"
  type        = "text"
  value       = var.opt_in_dynamic_api_scan
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_dynamic_ui_environment" {
  name        = "opt-in-dynamic-ui-scan"
  type        = "text"
  value       = var.opt_in_dynamic_ui_scan
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_dynamic_environment" {
  name        = "opt-in-dynamic-scan"
  type        = "text"
  value       = var.opt_in_dynamic_scan
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_sonar_environment" {
  name        = "opt-in-sonar"
  type        = "text"
  value       = var.opt_in_sonar
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_git_token_environment" {
  count       = (var.enable_pipeline_git_token) ? 1 : 0
  name        = "git-token"
  type        = "secure"
  value       = var.pipeline_git_token_secret_ref
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_doi_environment" {
  name        = "doi-environment"
  type        = "text"
  value       = var.doi_environment
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_doi_toolchain_id" {
  name        = "doi-toolchain-id"
  type        = "text"
  value       = var.doi_toolchain_id_pipeline_property
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_doi_api_key" {
  count       = var.link_to_doi_toolchain ? 1 : 0
  name        = "doi-ibmcloud-api-key"
  type        = "secure"
  value       = var.pipeline_doi_api_key_secret_ref
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_version" {
  name        = "version"
  type        = "text"
  value       = var.app_version
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_signing_key_secret_name" {
  count       = (var.enable_devops_signing_var) ? 1 : 0
  name        = "signing-key"
  type        = "secure"
  value       = var.signing_key_secret_ref
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_app_name" {
  name        = "app-name"
  type        = "text"
  value       = var.app_name
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_ibm_cloud_api" {
  name        = "ibmcloud-api"
  type        = "text"
  value       = var.ibmcloud_api
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

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_peer_review_compliance" {
  name        = "peer-review-compliance"
  type        = "text"
  value       = var.peer_review_compliance
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_dockerjson_config" {
  count       = (var.enable_pipeline_dockerconfigjson) ? 1 : 0
  name        = "pipeline-dockerconfigjson"
  type        = "secure"
  value       = var.pipeline_dockerconfigjson_secret_ref
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

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_code_engine_build_strategy" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "code-engine-build-strategy"
  type        = "text"
  value       = var.code_engine_build_strategy
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_code_engine_use_native" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "code-engine-build-use-native-docker"
  type        = "text"
  value       = var.code_engine_build_use_native_docker
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_code_engine_build_size" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "code-engine-build-size"
  type        = "text"
  value       = var.code_engine_build_size
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_code_engine_build_timeout" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "code-engine-build-timeout"
  type        = "text"
  value       = var.code_engine_build_timeout
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_code_engine_wait_timeout" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "code-engine-wait-timeout"
  type        = "text"
  value       = var.code_engine_wait_timeout
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_code_engine_context_dir" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "context-dir"
  type        = "text"
  value       = var.code_engine_context_dir
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_code_engine_dockerfile" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "dockerfile"
  type        = "text"
  value       = var.code_engine_dockerfile
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_code_engine_image_name" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "image-name"
  type        = "text"
  value       = var.code_engine_image_name
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_code_engine_registry_domain" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "registry-domain"
  type        = "text"
  value       = var.code_engine_registry_domain
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_code_engine_source" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "source"
  type        = "text"
  value       = var.code_engine_source
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_binding_rg" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "code-engine-binding-resource-group"
  type        = "text"
  value       = var.code_engine_binding_resource_group
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_deployment_type" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "code-engine-deployment-type"
  type        = "text"
  value       = var.code_engine_deployment_type
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_cpu" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "cpu"
  type        = "text"
  value       = var.code_engine_cpu
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_memory" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "memory"
  type        = "text"
  value       = var.code_engine_memory
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_ephemeral_storage" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "ephemeral-storage"
  type        = "text"
  value       = var.code_engine_ephemeral_storage
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_execution_time" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "job-maxexecutiontime"
  type        = "text"
  value       = var.code_engine_job_maxexecutiontime
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_retry_limit" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "job-retrylimit"
  type        = "text"
  value       = var.code_engine_job_retrylimit
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_job_instances" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "job-instances"
  type        = "text"
  value       = var.code_engine_job_instances
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_app_port" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "app-port"
  type        = "text"
  value       = var.code_engine_app_port
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_app_min_scale" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "app-min-scale"
  type        = "text"
  value       = var.code_engine_app_min_scale
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_app_max_scale" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "app-max-scale"
  type        = "text"
  value       = var.code_engine_app_max_scale
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_app_deployment_timeout" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "app-deployment-timeout"
  type        = "text"
  value       = var.code_engine_app_deployment_timeout
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_app_concurrency" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "app-concurrency"
  type        = "text"
  value       = var.code_engine_app_concurrency
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_app_visibility" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "app-visibility"
  type        = "text"
  value       = var.code_engine_app_visibility
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_configmaps" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "env-from-configmaps"
  type        = "text"
  value       = var.code_engine_env_from_configmaps
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_env_secrets" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "env-from-secrets"
  type        = "text"
  value       = var.code_engine_env_from_secrets
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_remove_refs" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "remove-unspecified-references-to-configuration-resources"
  type        = "text"
  value       = var.code_engine_remove_refs
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "cd_pipeline_code_engine_service_bindings" {
  count       = (var.deployment_target == "code-engine") ? 1 : 0
  name        = "service-bindings"
  type        = "text"
  value       = var.code_engine_service_bindings
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_base_image" {
  count       = (var.compliance_base_image == "") ? 0 : 1
  name        = "compliance-baseimage"
  type        = "text"
  value       = var.compliance_base_image
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

resource "ibm_cd_tekton_pipeline_property" "ci_opt_in_gosec" {
  name        = "opt-in-gosec"
  type        = "text"
  value       = var.opt_in_gosec
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_gosec_private_repository_host" {
  count       = var.gosec_private_repository_host == "" ? 0 : 1
  name        = "gosec-private-repository-host"
  type        = "text"
  value       = var.gosec_private_repository_host
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_gosec_private_repository_ssh_key" {
  count       = var.gosec_private_repository_host == "" ? 0 : 1
  name        = "gosec-private-repository-ssh-key"
  type        = "secure"
  value       = var.gosec_repository_ssh_secret_ref
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_cra_bom_generate" {
  name        = "cra-bom-generate"
  type        = "single_select"
  enum        = ["0", "1"]
  value       = var.cra_bom_generate
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_cra_vulnerability_scan" {
  name        = "cra-vulnerability-scan"
  type        = "single_select"
  enum        = ["0", "1"]
  value       = var.cra_vulnerability_scan
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_cra_deployment_analysis" {
  name        = "cra-deploy-analysis"
  type        = "single_select"
  enum        = ["0", "1"]
  value       = var.cra_deploy_analysis
  pipeline_id = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}
