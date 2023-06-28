variable "app_repo_existing_url" {
}

variable "app_repo_existing_branch" {
}

variable "app_repo_clone_from_url" {
}

variable "app_repo_clone_from_branch" {
}

variable "app_repo_existing_git_provider" {
}
variable "app_repo_existing_git_id" {
}
variable "app_repo_clone_to_git_provider" {
}
variable "app_repo_clone_to_git_id" {
}

variable "app_repo_template_url" {
}

variable "default_git_provider" {
}

variable "app_repo_auth_type" {
}

variable "app_repo_git_token_secret_name" {
}

variable "secret_tool" {
  type        = string
  description = "Used as part of secret references to point to the secret store tool integration"
}

variable "repositories_prefix" {
}

variable "toolchain_id" {
}

variable "toolchain_region" {
}

variable "toolchain_crn" {
  type        = string
  description = "The CRN of the created toolchain"
}

variable "app_group" {
}

variable "app_repo_integration_owner" {
}
