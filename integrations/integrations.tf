resource "ibm_iam_authorization_policy" "toolchain_keyprotect_auth_policy" {
  source_service_name         = "toolchain"
  source_resource_instance_id = var.toolchain_id
  target_service_name         = "kms"
  target_resource_instance_id = var.key_protect_instance_guid
  roles                       = ["Viewer", "ReaderPlus"]
}

resource "ibm_toolchain_tool_keyprotect" "keyprotect" {
  toolchain_id = var.toolchain_id
  parameters {
    name           = var.key_protect_integration_name
    region         = var.region
    resource_group = var.resource_group
    instance_name  = var.key_protect_instance_name
  }
}

resource "ibm_toolchain_tool_insights" "insights_tool" {
  toolchain_id = var.toolchain_id
}

resource "ibm_toolchain_tool_slack" "slack_tool" {
  toolchain_id = var.toolchain_id
  parameters {
    api_token = var.slack_api_token
    channel_name = var.slack_channel_name
    team_url = var.slack_user_name
  }
}

resource "ibm_toolchain_tool_custom" "cos_integration" {
  toolchain_id = var.toolchain_id
  parameters {
      type = "cos-bucket"
      lifecycle_phase = "MANAGE"
      image_url = "https://github.ibm.com/one-pipeline/compliance-ci-toolchain/raw/master/.bluemix/cos-logo.png"
      documentation_url = "https://cloud.ibm.com/catalog/services/cloud-object-storage"
      name = "Evidence Store"
      dashboard_url = "https://cloud.ibm.com/catalog/services/cloud-object-storage"
      description = "Cloud Object Storage to store evidences within DevSecOps Pipelines"
  }
}

resource "ibm_toolchain_tool_orion" "orion_tool" {
  toolchain_id = var.toolchain_id
}

output "keyprotect_integration_name" {
  value = var.key_protect_integration_name
}

