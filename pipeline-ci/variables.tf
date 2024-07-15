variable "pipeline_id" {
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

variable "cos_api_key_secret_ref" {
}

variable "pipeline_ibmcloud_api_key_secret_ref" {
}

variable "enable_pipeline_dockerconfigjson" {
}

variable "dev_region" {
}

variable "registry_namespace" {
}

variable "registry_region" {
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

variable "doi_toolchain_id_pipeline_property" {
}

variable "pipeline_doi_api_key_secret_ref" {
}

variable "link_to_doi_toolchain" {
}

variable "sonarqube_config" {
}

variable "sonarqube_tool" {
}

variable "event_notifications" {
}

variable "ci_pipeline_branch" {
}

variable "pipeline_git_tag" {
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
