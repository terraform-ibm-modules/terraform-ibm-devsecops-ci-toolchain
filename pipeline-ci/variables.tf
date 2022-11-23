variable "pipeline_id" {
}

variable "resource_group" {
}

variable "app_name" {
}

variable "app_image_name" {
}

variable "cluster_name" {
}

variable "cluster_namespace" {
}

variable "cluster_region" {
}

variable "registry_namespace" {
}

variable "registry_region" {
}

variable "region" {
}

variable "ibm_cloud_api" {
}

variable "ibm_cloud_api_key" {
}

variable "sm_integration_name" {
}

variable "app_repo" {
}

variable "cos_api_key" {
}

variable "cos_bucket_name" {
}

variable "cos_endpoint" {
}

variable "pipeline_repo" {
    type        = string
    description = "The repository url containing pipeline definitions for Compliance CI Toolchain."
}

variable "inventory_repo" {
}

variable "evidence_repo" {
}

variable "issues_repo" {    
}

variable "sm_group" {
  type        = string
  description = "The default Secrets Manager group for your secrets. "
  default     = "Default"
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

variable "ci_pipeline_max_concurrent_runs" {
  type        = number
  description = "The number of maximum concurrent runs to be supported by CI Pipeline"
  default     = 1
}