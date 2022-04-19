variable "toolchain_id" {
}

variable "resource_group" {
}

variable "region" {
}

variable "key_protect_integration_name" {
  type        = string
  description = "Name of the Key Protect Toolchain Integration"
  default     = "Key Protect Integration Instance"
}

variable "key_protect_instance_name" {
  type        = string
  description = "Name of the Key Protect Toolchain Service Instance in IBM Cloud"
}

variable "key_protect_instance_guid" {
  type        = string
  description = "GUID of the Key Protect Toolchain Service Instance in IBM Cloud"
}

variable "key_protect_service_auth" {
  type        = string
  description = "Authorization Permission for the Key Protect Toolchain Service Instance in IBM Cloud"
  default     = "[\"Viewer\", \"ReaderPlus\"]"
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