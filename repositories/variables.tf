variable "app_repo" {
    type        = string
    description = "This repository contains a simple Node.js microservice that can be deployed with reference DevSecOps toolchain templates."
}

variable "app_repo_type" {
    type        = string
    description = "The repository type for application repo. One of [clone, link, hostedgit]"
    default     = "hostedgit"    
}

variable "pipeline_repo" {
    type        = string
    description = "This repository contains the tekton definitions for compliance pipelines."
}

variable "pipeline_repo_type" {
    type        = string
    description = "The repository type for pipeline repo. One of [clone, link, hostedgit]"
    default     = "hostedgit"
}

variable "inventory_repo" {
    type        = string
    description = "This is a template repository to clone compliance-inventory for reference DevSecOps toolchain templates."
}

variable "inventory_repo_type" {
    type        = string
    description = "The repository type for inventory repo. One of [clone, link, hostedgit]"
    default     = "hostedgit"
}

variable "evidence_repo" {
    type        = string
    description = "This is a template repository to clone compliance-evidence-locker for reference DevSecOps toolchain templates."
}

variable "evidence_repo_type" {
    type        = string
    description = "The repository type for evidence repo. One of [clone, link, hostedgit]"
    default     = "hostedgit"
}

variable "issues_repo" {
    type        = string
    description = "This is a template repository to clone compliance-issues for reference DevSecOps toolchain templates."
}

variable "issues_repo_type" {
    type        = string
    description = "The repository type for issues repo. One of [clone, link, hostedgit]"
    default     = "hostedgit"
}

variable "toolchain_id" {
}

variable "resource_group" {
}

variable "region" {
}

variable "ibm_cloud_api_key" {
}