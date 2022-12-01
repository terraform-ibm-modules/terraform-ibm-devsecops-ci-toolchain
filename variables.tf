variable "toolchain_resource_group" {
  type        = string
  description = "Resource group within which toolchain will be created"
  default     = "Default"
}

variable "ibm_cloud_api_key" {
  type        = string
  description = "IBM Cloud API KEY to fetch/post cloud resources in terraform. Not used in the pipeline, where a secret reference is used instead."
  sensitive   = true
}

variable "ibm_cloud_api" {
  type        = string
  description = "IBM Cloud API Endpoint"
  default     = "https://cloud.ibm.com"
}

variable "toolchain_region" {
  type        = string
  description = "IBM Cloud region where your toolchain will be created"
  default     = "us-south"
}

variable "toolchain_name" {
  type        = string
  description = "Name of the Toolchain."
  default     = "DevSecOps CI Toolchain - Terraform"
}

variable "toolchain_description" {
  type        = string
  description = "Description for the Toolchain."
  default     = "Toolchain created with terraform template for DevSecOps CI Best Practices"
}

variable "app_name" {
  type        = string
  description = "Name of the application."
  default     = "hello-compliance-app"
}

variable "app_image_name" {
  type        = string
  description = "Name of the application image."
  default     = "hello-compliance-app-image"
}

variable "cluster_name" {
  type        = string
  description = "Name of the kubernetes cluster where the application will be deployed."
  default     = "mycluster-free"
}

variable "cluster_namespace" {
  type        = string
  description = "Name of the kubernetes cluster where the application will be deployed."
  default     = "devsecops-ci-ns"
}

variable "dev_region" {
  type        = string
  description = "Region of the kubernetes cluster where the application will be deployed."
  default     = "ibm:yp:us-south"
}

variable "dev_resource_group" {
  type        = string
  description = "The cluster resource group."
  default     = "Default"
}

variable "registry_namespace" {
  type        = string
  description = "Namespace within the IBM Cloud Container Registry where application image need to be stored."
  default     = "devsecops-ci-registry"
}

variable "registry_region" {
  type        = string
  description = "IBM Cloud Region where the IBM Cloud Container Registry where registry is to be created."
  default     = "ibm:yp1:us-south"
}

variable "sm_name" {
  type        = string
  description = "Name of the Secrets Manager instance where the secrets are stored."
}

variable "sm_location" {
  type        = string
  description = "IBM Cloud location containing the Secrets Manager instance."
  default     = "us-south"
}

variable "app_repo_clone_from_url" {
    type        = string
    description = "(Optional) Override the default sample app by providing your own sample app url, which will be cloned into the app repo. Note, using clone_if_not_exists mode, so if the app repo already exists the repo contents are unchanged."
    default     = ""
}

variable "app_repo_clone_from_branch" {
    type        = string
    description = "Used when app_repo_clone_from_url is provided, the default branch that will be used by the CI build, usually either main or master."
    default     = ""
}

variable "app_repo_existing_url" {
    type        = string
    description = "(Optional) Override to bring your own existing application repository URL, which will be used directly instead of cloning the default sample."
    default     = ""
}

variable "app_repo_existing_branch" {
    type        = string
    description = "Used when app_repo_existing_url is provided, the default branch that will be used by the CI build, usually either main or master."
    default     = ""
}

variable "app_repo_type" {
    type        = string
    description = "The repository type for application repo. One of [clone, link]"
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

# variable "cos_api_key" {
#   type        = string
#   description = "cos api key"
#   default     = ""
# }

variable "cos_endpoint" {
  type        = string
  description = "cos endpoint name"
  default     = ""
}

variable "cos_bucket_name" {
  type        = string
  description = "cos bucket name"
  default     = ""
}

variable "sm_secret_group" {
  type        = string
  description = "The Secrets Manager secret group containing your secrets."
  default     = "Default"
}

variable "sm_resource_group" {
  type        = string
  description = "The resource group containing the Secrets Manager instance for your secrets."
  default     = "Default"
}
