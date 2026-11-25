variable "toolchain_id" {
  type        = string
  description = "The ID of the toolchain containing the pipelines and triggers."
  default     = ""
}

variable "pipeline_repo_data" {
}

variable "config_data" {
}

variable "pipeline_data" {
}

variable "create_default_triggers" {
  type        = bool
  description = "Set to `true` to allow creation of default triggers."
  default     = true
}
