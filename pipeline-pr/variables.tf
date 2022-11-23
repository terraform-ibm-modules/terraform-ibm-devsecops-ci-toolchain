variable "pipeline_id" {
}

variable "resource_group" {
}

variable "app_name" {
}

variable "sm_integration_name" {
}

variable "sm_group" {
  type        = string
  description = "The default Secrets Manager group for your secrets. "
  default     = "Default"
}

variable "app_repo" {
}

variable "pipeline_repo" {
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

variable "region" {
}

variable "ibm_cloud_api_key" {
}

variable "ibm_cloud_api" {
}

variable "pr_pipeline_max_concurrent_runs" {
  type        = number
  description = "The number of maximum concurrent runs to be supported by PR Pipeline"
  default     = 1
}