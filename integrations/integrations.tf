resource "ibm_iam_authorization_policy" "toolchain_secretsmanager_auth_policy" {
  source_service_name         = "toolchain"
  source_resource_instance_id = var.toolchain_id
  target_service_name         = "secrets-manager"
  target_resource_instance_id = var.secrets_manager_instance_guid
  roles                       = ["Viewer", "SecretsReader"]
}

# resource "ibm_cd_toolchain_tool_keyprotect" "keyprotect" {
#   toolchain_id = var.toolchain_id
#   parameters {
#     name           = var.key_protect_integration_name
#     region         = var.region
#     resource_group = var.resource_group
#     instance_name  = var.key_protect_instance_name
#   }
# }

 resource "ibm_cd_toolchain_tool_secretsmanager" "secretsmanager" {
   toolchain_id = var.toolchain_id
   parameters {
     name                = var.secrets_manager_integration_name
     location            = var.region
     resource_group_name = var.resource_group
     instance_name       = var.secrets_manager_instance_name
   }
 }

resource "ibm_cd_toolchain_tool_devopsinsights" "devopsinsights_tool" {
  toolchain_id = var.toolchain_id
}

# resource "ibm_cd_toolchain_tool_slack" "slack_tool" {
#   toolchain_id = var.toolchain_id
#   parameters {
#     api_token = var.slack_api_token
#     channel_name = var.slack_channel_name
#     team_url = var.slack_user_name
#   }
# }

resource "ibm_cd_toolchain_tool_custom" "cos_integration" {
  toolchain_id = var.toolchain_id
  parameters {
      type = "cos-bucket"
      lifecycle_phase = "MANAGE"
      image_url = "https://github.ibm.com/open-toolchain/compliance-ci-toolchain/raw/master/.bluemix/cos-logo.png"
      documentation_url = "https://cloud.ibm.com/catalog/services/cloud-object-storage"
      name = "Evidence Store"
      dashboard_url = "https://cloud.ibm.com/catalog/services/cloud-object-storage"
      description = "Cloud Object Storage to store evidences within DevSecOps Pipelines"
  }
}

# output "keyprotect_integration_name" {
#   value = var.key_protect_integration_name
# }
output "secretsmanager_integration_name" {
  value = var.secrets_manager_integration_name
}

