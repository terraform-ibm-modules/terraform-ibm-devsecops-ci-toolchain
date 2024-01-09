variable "pipeline_id" {
}

variable "dev_resource_group" {
}

variable "app_name" {
}

variable "enable_privateworker" {
}

variable "enable_artifactory" {
}

variable "enable_pipeline_git_token" {
}

variable "tool_artifactory" {
}

variable "private_worker" {
}

variable "signing_key_secret_ref" {
}

variable "cos_api_key_secret_ref" {
}

variable "pipeline_ibmcloud_api_key_secret_ref" {
}

variable "pipeline_dockerconfigjson_secret_ref" {
}

variable "pipeline_git_token_secret_ref" {
}

variable "enable_pipeline_dockerconfigjson" {
}

variable "cluster_name" {
}

variable "cluster_namespace" {
}

variable "dev_region" {
}

variable "registry_namespace" {
}

variable "registry_region" {
}

variable "ibmcloud_api" {
}

variable "ibmcloud_api_key" {
}

variable "app_repo_url" {
}

variable "app_repo_branch" {
}

variable "cos_bucket_name" {
}

variable "cos_endpoint" {
}

variable "pipeline_repo_url" {
}

variable "inventory_repo_url" {
}

variable "evidence_repo_url" {
}

variable "issues_repo_url" {
}

variable "inventory_repo" {
}

variable "evidence_repo" {
}

variable "issues_repo" {
}

variable "pipeline_config_repo" {
}

variable "pipeline_config_repo_existing_url" {
}

variable "pipeline_config_repo_clone_from_url" {
}

variable "pipeline_config_repo_branch" {
}

variable "pipeline_config_path" {
}

variable "pipeline_debug" {
}

variable "opt_in_dynamic_api_scan" {
}

variable "opt_in_dynamic_ui_scan" {
}

variable "opt_in_dynamic_scan" {
}

variable "opt_in_sonar" {
}

variable "doi_environment" {
}

variable "doi_toolchain_id_pipeline_property" {
}

variable "pipeline_doi_api_key_secret_ref" {
}

variable "link_to_doi_toolchain" {
}

variable "cra_generate_cyclonedx_format" {
}

variable "custom_image_tag" {
}

variable "app_version" {
}

variable "sonarqube_config" {
}

variable "sonarqube_tool" {
}

variable "peer_review_compliance" {
}

variable "slack_notifications" {
}

variable "ci_pipeline_branch" {
  type        = string
  description = "The branch within pipeline definitions repository for Compliance CI Toolchain."
  default     = "open-v10"
}

variable "pipeline_path" {
  type        = string
  description = "The relative folder path within pipeline definitions repository containing tekton definitions for pipelines."
  default     = "definitions"
}

variable "ci_pipeline_max_concurrent_runs" {
  type        = number
  description = "The number of maximum concurrent runs to be supported by CI Pipeline"
  default     = 1
}

######## Deployment Strategy ##################

variable "deployment_target" {
}

######## Code Engine Vars #####################

variable "code_engine_project" {
}

variable "code_engine_region" {
}

variable "code_engine_resource_group" {
}

variable "code_engine_build_strategy" {
}

variable "code_engine_build_use_native_docker" {
}

variable "code_engine_build_size" {
}

variable "code_engine_build_timeout" {
}

variable "code_engine_wait_timeout" {
}

variable "code_engine_context_dir" {
}

variable "code_engine_dockerfile" {
}

variable "code_engine_image_name" {
}

variable "code_engine_registry_domain" {
}

variable "code_engine_source" {
}

variable "code_engine_binding_resource_group" {
}

variable "code_engine_deployment_type" {
}

variable "code_engine_cpu" {
}

variable "code_engine_memory" {
}

variable "code_engine_ephemeral_storage" {
}

variable "code_engine_job_maxexecutiontime" {
}

variable "code_engine_job_retrylimit" {
}

variable "code_engine_job_instances" {
}

variable "code_engine_app_port" {
}

variable "code_engine_app_min_scale" {
}

variable "code_engine_app_max_scale" {
}

variable "code_engine_app_deployment_timeout" {
}

variable "code_engine_app_concurrency" {
}

variable "code_engine_app_visibility" {
}

variable "code_engine_env_from_configmaps" {
}

variable "code_engine_env_from_secrets" {
}

variable "code_engine_remove_refs" {
}

variable "code_engine_service_bindings" {
}

variable "app_repo_provider_webhook_syntax" {
}

variable "enable_devops_signing_var" {
}

variable "trigger_git_name" {
}
variable "trigger_git_enable" {
}

variable "trigger_timed_name" {
}
variable "trigger_timed_enable" {
}
variable "trigger_timed_cron_schedule" {
}

variable "trigger_manual_name" {
}
variable "trigger_manual_enable" {
}

variable "trigger_manual_pruner_name" {
}
variable "trigger_manual_pruner_enable" {
}

variable "trigger_timed_pruner_name" {
}
variable "trigger_timed_pruner_enable" {
}

variable "enable_pipeline_notifications" {
}

variable "compliance_base_image" {
  type        = string
  description = "Pipeline baseimage to run most of the built-in pipeline code"
  default     = ""
}

variable "opt_in_gosec" {
}

variable "gosec_private_repository_host" {
}

variable "gosec_repository_ssh_secret_ref" {
}

