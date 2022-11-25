variable "app_repo_clone_from_url" {
    type        = string
    description = "This repository contains a simple Node.js microservice that can be deployed with reference DevSecOps toolchain templates."
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
