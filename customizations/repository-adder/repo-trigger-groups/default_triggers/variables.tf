variable "repository_integration_id" {
  type        = string
  description = "The tool integration ID for the repository."
  default     = ""
}

variable "default_branch" {
  type        = string
  description = "The default branch of the repository."
  default     = ""
}

variable "default_trigger_ci_cel_filter" {
  type        = string
  description = "Set a CEL filter for the default created CI GIT triggers."
  default     = ""
}

variable "default_trigger_ci_pattern" {
  type        = string
  description = "Set a pattern for the default created CI GIT triggers."
  default     = ""
}

variable "default_trigger_pr_cel_filter" {
  type        = string
  description = "Set a CEL filter for the default created PR GIT triggers."
  default     = ""
}

variable "default_trigger_pr_pattern" {
  type        = string
  description = "Set a pattern for the default created PR GIT triggers."
  default     = ""
}

variable "repository_url" {
  type        = string
  description = "The repository URL."
  default     = ""
}

variable "max_concurrent_runs" {
  type        = number
  description = "The max number of concurrent runs."
  default     = 1
}

variable "config_data" {
}

variable "pipeline_data" {
}
