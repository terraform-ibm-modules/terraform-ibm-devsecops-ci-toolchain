variable "toolchain_id" {
}

variable "sm_resource_group" {
}

variable "sm_location" {
}

variable "sm_name" {
}

variable "sm_secret_group" {
}

variable "sm_instance_guid" {
  type        = string
  description = "GUID of the Secrets Manager service instance in IBM Cloud"
}

variable "kp_resource_group" {
}

variable "kp_location" {
}

variable "kp_name" {
}

variable "enable_key_protect" {
}

variable "enable_secrets_manager" {
}

variable "kp_instance_guid" {
  type        = string
  description = "GUID of the KeyProtect service instance in IBM Cloud"
}

#variable "key_protect_service_auth" {
#  type        = string
#  description = "Authorization Permission for the Key Protect Toolchain Service Instance in IBM Cloud"
#  default     = "[\"Viewer\", \"ReaderPlus\"]"
#}

variable "enable_slack" {
}

variable "slack_webhook_secret_ref" {
}

variable "slack_channel_name" {
}

variable "slack_team_name" {
}

variable "slack_pipeline_fail" {
}

variable "slack_pipeline_start" {
}

variable "slack_pipeline_success" {
}

variable "slack_toolchain_bind" {
}

variable "slack_toolchain_unbind" {
}

variable "authorization_policy_creation" {
}

variable "link_to_doi_toolchain" {
}

variable "doi_toolchain_id" {
}

variable "enable_artifactory" {
}
variable "artifactory_dashboard_url" {
}
variable "artifactory_user" {
}
variable "artifactory_token_secret_ref" {
}
variable "artifactory_repo_name" {
}
variable "artifactory_repo_url" {
}
variable "artifactory_integration_name" {
}
variable "enable_privateworker" {
}

variable "worker_id" {
}

variable "privateworker_credentials_secret_ref" {
}

variable "privateworker_name" {
}

variable "concert_dashboard_url" {
}

variable "concert_description" {
}

variable "concert_documentation_url" {
}

variable "concert_integration_name" {
}

variable "enable_concert" {
}

variable "cos_dashboard_url" {
}

variable "cos_description" {
}

variable "cos_documentation_url" {
}

variable "cos_hmac_access_key_id_ref" {
}

variable "cos_hmac_secret_access_key_ref" {
}

variable "cos_integration_name" {
}

variable "cos_endpoint" {
}

variable "cos_instance_crn" {
}

variable "cos_api_key_secret_ref" {
}

variable "cos_bucket_name" {
}

variable "use_legacy_cos_tool" {
}

variable "sm_integration_name" {
}

variable "sm_instance_crn" {
}

variable "kp_integration_name" {
}

variable "slack_integration_name" {
}

variable "event_notifications_tool_name" {
}

variable "event_notifications_crn" {
}

variable "sonarqube_integration_name" {
}

variable "sonarqube_user" {
}

variable "sonarqube_secret_ref" {
}

variable "sonarqube_is_blind_connection" {
}

variable "sonarqube_server_url" {
}

variable "enable_insights" {
}

variable "enable_cos" {
}
