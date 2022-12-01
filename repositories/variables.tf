variable "app_repo_existing_url" {
}

variable "app_repo_existing_branch" {
}

variable "app_repo_clone_from_url" {
}

variable "app_repo_clone_from_branch" {
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
