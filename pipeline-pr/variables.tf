variable "pipeline_id" {
}

variable "app_name" {
}

variable "app_repo_url" {
}

variable "app_repo_branch" {
}
variable "issues_repo" {
}

variable "evidence_repo" {

}

variable "pipeline_config_repo" {
}

variable "pipeline_config_repo_existing_url" {
}

variable "pipeline_config_repo_clone_from_url" {
}

variable "pipeline_repo_url" {
  type        = string
  description = "The repository url containing pipeline definitions for Compliance CI Toolchain."
}

variable "pr_pipeline_branch" {
}

variable "pipeline_git_tag" {
}

variable "pipeline_path" {
  type        = string
  description = "The relative folder path within pipeline definitions repository containing tekton definitions for pipelines."
  default     = "definitions"
}

variable "ibmcloud_api_key" {
}

variable "pr_pipeline_max_concurrent_runs" {
  type        = number
  description = "The number of maximum concurrent runs to be supported by PR Pipeline"
  default     = 1
}

variable "add_pipeline_definitions" {
}

variable "app_repo_provider_webhook_syntax" {
}

variable "tool_artifactory" {
}

variable "enable_artifactory" {
}

variable "create_git_triggers" {
}

variable "trigger_pr_git_name" {
}

variable "trigger_pr_git_enable" {
}

variable "enable_pipeline_notifications" {
}

variable "default_locked_properties" {
}
