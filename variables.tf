variable "resource_group" {
  type        = string
  description = "Resource group within which toolchain will be created"
  default     = "Default"
}

variable "ibm_cloud_api_key" {
  type        = string
  description = "IBM Cloud API KEY to fetch cloud resources"
}

variable "ibm_cloud_api" {
  type        = string
  description = "IBM Cloud API Endpoint"
  default     = "https://cloud.ibm.com"
}

variable "region" {
  type        = string
  description = "IBM Cloud region where your toolchain will be created"
  default     = "us-south"
}

variable "toolchain_name" {
  type        = string
  description = "Name of the Toolchain."
  default     = "Terraform Toolchain Empty"
}

variable "toolchain_description" {
  type        = string
  description = "Description for the Toolchain."
  default     = "Toolchain created using IBM Cloud Continuous Delivery Service"
}

variable "app_name" {
  type        = string
  description = "Name of the application."
  default     = "secure-app-nonterraform"
}

variable "app_image_name" {
  type        = string
  description = "Name of the application image."
  default     = "secure-app-nonterraform-image"
}

variable "cluster_name" {
  type        = string
  description = "Name of the kubernetes cluster where the application will be deployed."
  default     = "MyFreeCluster"
}

variable "cluster_namespace" {
  type        = string
  description = "Name of the kubernetes cluster where the application will be deployed."
  default     = "prod"
}

variable "cluster_region" {
  type        = string
  description = "Region of the kubernetes cluster where the application will be deployed."
  default     = "ibm:ys1:us-south"
}

variable "registry_namespace" {
  type        = string
  description = "Namespace within the IBM Cloud Container Registry where application image need to be stored."
  default     = "alpha-cd-namespace"
}

variable "registry_region" {
  type        = string
  description = "IBM Cloud Region where the IBM Cloud Container Registry where registry is to be created."
  default     = "ibm:ys1:us-south"
}

variable "kp_name" {
  type        = string
  description = "Name of the Key Protect Instance to store the secrets."
}

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

variable "slack_api_token" {
  type        = string
  description = "API Token for Slack Channel"
  default     = ""
}

variable "slack_channel_name" {
  type        = string
  description = "Name of Slack Channel"
  default     = ""
}

variable "slack_user_name" {
  type        = string
  description = "Name of Slack User"
  default     = ""
}