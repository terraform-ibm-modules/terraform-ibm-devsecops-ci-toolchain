#variable "key_protect_instance_name" {
#  type        = string
#  description = "Name of the Key Protect Toolchain Service Instance in IBM Cloud"
#}
variable "sm_name" {
}

variable "sm_resource_group" {
}

variable "enable_key_protect" {
  type        = bool
  default     = false
}

variable "enable_secrets_manager" {
  type        = bool
  default     = true
}

variable "sm_location" {
}

variable "kp_name" {
}

variable "kp_resource_group" {
}

variable "kp_location" {
}

variable "cluster_name" {
}

variable "cluster_namespace" {
}

variable "registry_namespace" {
}

variable "registry_region" {
}


