variable "pipeline_id" {
}

variable "app_name" {
}

variable "secret_tool" {
  type        = string
  description = "Used as part of secret references to point to the secret store tool integration"
}

variable "app_repo_url" {
}

variable "app_repo_branch" {
}

variable "config_repo_branch" {
}

variable "pipeline_repo_url" {
    type        = string
    description = "The repository url containing pipeline definitions for Compliance CI Toolchain."
}

variable "pipeline_branch" {
  type        = string
  description = "The branch within pipeline definitions repository for Compliance CI Toolchain."
  default     = "open-v9"
}

variable "pipeline_path" {
  type        = string
  description = "The relative folder path within pipeline definitions repository containing tekton definitions for pipelines."
  default     = "definitions"
}
variable "compliance_base_image" {
  type        = string
  description = "Pipeline baseimage to run most of the built-in pipeline code"
  default     = ""
}

variable "ibm_cloud_api_key" {
}

variable "pipeline_ibmcloud_api_key_secret_name" {
}

variable "ibm_cloud_api" {
}

variable "pr_pipeline_max_concurrent_runs" {
  type        = number
  description = "The number of maximum concurrent runs to be supported by PR Pipeline"
  default     = 1
}

variable "app_repo_provider_webhook_syntax" {
}
