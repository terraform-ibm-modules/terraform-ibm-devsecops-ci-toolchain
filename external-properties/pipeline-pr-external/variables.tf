variable "pipeline_id" {
}

variable "secret_tool" {
  type        = string
  description = "Used as part of secret references to point to the secret store tool integration"
}

variable "app_repo_url" {
}

variable "app_repo_branch" {
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

variable "vault_secret_id_secret_name" {
}

variable "pr_pipeline_max_concurrent_runs" {
  type        = number
  description = "The number of maximum concurrent runs to be supported by PR Pipeline"
  default     = 1
}

variable "app_repo_provider_webhook_syntax" {
}

variable "external_properties_repo_url" {
}

variable "external_properties_branch" {
  type        = string
  description = "The branch within the repository that contains the definition of the external properties."
  default     = "master"
}

variable "external_properties_path" {
  type        = string
  description = "The relative folder path within the repository containing the external properties."
  default     = "tekton"
}
