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

variable "tool_artifactory" {
}

variable "private_worker" {
}

variable "signing_key_secret_name" {
}

variable "cos_api_key_secret_name" {
}

variable "pipeline_ibmcloud_api_key_secret_name" {
}

variable "pipeline_dockerconfigjson_secret_name" {
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

variable "secret_tool" {
  type        = string
  description = "Used as part of secret references to point to the secret store tool integration"
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

variable "opt_out_v1_evidence" {
}

variable "opt_in_sonar" {
}

variable "doi_environment" {
}

variable "doi_toolchain_id_pipeline_property" {
}

variable "cra_generate_cyclonedx_format" {
}

variable "custom_image_tag" {
}

variable "app_version" {
}

variable "sonarqube_config" {
}

variable "slack_notifications" {
}

variable "ci_pipeline_branch" {
  type        = string
  description = "The branch within pipeline definitions repository for Compliance CI Toolchain."
  default     = "open-v9"
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

variable "code_engine_entity_type" {
}

variable "code_engine_build_strategy" {
}

variable "code_engine_source" {
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
