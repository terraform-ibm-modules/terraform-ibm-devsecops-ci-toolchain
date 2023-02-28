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

variable "pipeline_config_repo_existing_url" {
}

variable "pipeline_config_repo_branch" {
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
variable "issues_group" {
}

variable "inventory_group" {
}

variable "evidence_group" {
}