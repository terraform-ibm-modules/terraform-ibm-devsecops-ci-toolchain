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

variable "ci_pipeline_manual_trigger_name" {
  type        = string
  description = "The name of Manual Trigger for CI Pipeline as defined in tekton definition."
  default     = "Manual Trigger"
}

variable "ci_pipeline_manual_trigger_type" {
  type        = string
  description = "The type of Manual Trigger for CI Pipeline as defined in tekton definition."
  default     = "manual"
}

variable "ci_pipeline_manual_trigger_disabled" {
  type        = bool
  description = "Flag to disable manual CI Trigger"
  default     = false
}

variable "ci_pipeline_manual_trigger_listener_name" {
  type        = string
  description = "The name of EventListener for the CI Pipeline SCM Trigger as defined in tekton definition."
  default     = "ci-listener-gitlab"
}

variable "ci_pipeline_scm_trigger_name" {
  type        = string
  description = "The name of SCM Trigger for CI Pipeline as defined in tekton definition."
  default     = "SCM Trigger"
}

variable "ci_pipeline_scm_trigger_type" {
  type        = string
  description = "The type of SCM Trigger for CI Pipeline as defined in tekton definition."
  default     = "scm"
}

variable "ci_pipeline_scm_trigger_disabled" {
  type        = bool
  description = "Flag to disable SCM CI Trigger"
  default     = false
}

variable "ci_pipeline_scm_trigger_listener_name" {
  type        = string
  description = "The name of EventListener for the CI Pipeline SCM Trigger as defined in tekton definition."
  default     = "ci-listener-gitlab"
}

variable "ci_pipeline_timed_trigger_name" {
  type        = string
  description = "The name of Timed Trigger for CI Pipeline as defined in tekton definition."
  default     = "Timed Trigger"
}

variable "ci_pipeline_timed_trigger_type" {
  type        = string
  description = "The type of Trigger for CI Pipeline as defined in tekton definition."
  default     = "timer"
}

variable "ci_pipeline_timed_trigger_disabled" {
  type        = bool
  description = "Flag to disable TIMED CI Trigger"
  default     = false
}

variable "ci_pipeline_timed_trigger_listener_name" {
  type        = string
  description = "The name of EventListener for the CI Pipeline Timed Trigger as defined in tekton definition."
  default     = "ci-listener-gitlab"
}

variable "ci_pipeline_max_concurrent_runs" {
  type        = number
  description = "The number of maximum concurrent runs to be supported by CI Pipeline"
  default     = 1
}