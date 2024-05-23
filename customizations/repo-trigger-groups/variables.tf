variable "toolchain_id" {
  type        = string
  description = "The toolchain ID."
  default     = ""
}

variable "pipeline_id" {
  type        = string
  description = "The pipeline ID."
  default     = ""
}

variable "git_token_secret_ref" {
  type        = string
  description = "The secret ref to the Secrets Manager secret for the Git Token."
  default     = ""
}

variable "owner" {
  type        = string
  description = "The name of the repository owner."
  default     = ""
}

variable "repo_data" {
}
