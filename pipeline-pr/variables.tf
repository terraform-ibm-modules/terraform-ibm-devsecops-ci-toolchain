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

variable "pr_pipeline_scm_trigger_type" {
  type        = string
  description = "The type of SCM Trigger for PR Pipeline as defined in tekton definition."
  default     = "scm"
}

variable "pr_pipeline_scm_trigger_name" {
  type        = string
  description = "The name of SCM Trigger for PR Pipeline as defined in tekton definition."
  default     = "SCM Trigger"
}

variable "pr_pipeline_scm_trigger_listener_name" {
  type        = string
  description = "The name of EventListener for the PR Pipeline SCM Trigger as defined in tekton definition."
  default     = "pr-listener-gitlab"
}

variable "pr_pipeline_scm_trigger_disabled" {
  type        = bool
  description = "Flag to disable SCM CI Trigger"
  default     = false
}

variable "pr_pipeline_max_concurrent_runs" {
  type        = number
  description = "The number of maximum concurrent runs to be supported by PR Pipeline"
  default     = 1
}