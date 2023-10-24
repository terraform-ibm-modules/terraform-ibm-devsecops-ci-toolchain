##############################################################################
# Outputs
##############################################################################

output "private_worker" {
  value = (var.enable_privateworker) ? ibm_cd_toolchain_tool_privateworker.cd_toolchain_tool_privateworker_instance[0].tool_id : "public"
}

output "ibm_cd_toolchain_tool_artifactory" {
  value = (var.enable_artifactory) ? ibm_cd_toolchain_tool_artifactory.cd_toolchain_tool_artifactory_instance[0].tool_id : null
}

output "secret_tool" {
  value = (var.enable_key_protect) ? local.kp_integration_name : local.sm_integration_name
  # Before returning this tool integration name
  # used to construct {vault:: secret references,
  # the authorization_policy must have been successfully created,
  # and the tool integration must have been created,
  # otherwise the secret references would not resolve and
  # other tools using secret references could give errors during tool integration creation
  depends_on = [
    ibm_iam_authorization_policy.toolchain_secretsmanager_auth_policy,
    ibm_iam_authorization_policy.toolchain_keyprotect_auth_policy,
    ibm_cd_toolchain_tool_secretsmanager.secretsmanager,
    ibm_cd_toolchain_tool_keyprotect.keyprotect
  ]
  description = "Used as part of secret references to point to the secret store tool integration"
}

output "secret_tool_v1" {
  value = (var.enable_key_protect) ? local.kp_integration_name : format("%s.%s", local.sm_integration_name, var.sm_secret_group)
  # Before returning this tool integration name
  # used to construct {vault:: secret references,
  # the authorization_policy must have been successfully created,
  # and the tool integration must have been created,
  # otherwise the secret references would not resolve and
  # other tools using secret references could give errors during tool integration creation
  depends_on = [
    ibm_iam_authorization_policy.toolchain_secretsmanager_auth_policy,
    ibm_iam_authorization_policy.toolchain_keyprotect_auth_policy,
    ibm_cd_toolchain_tool_secretsmanager.secretsmanager,
    ibm_cd_toolchain_tool_keyprotect.keyprotect
  ]
  description = "The legacy secret tool. Used as part of secret references to point to the secret tool integration. This is the legacy version of the secrets tool. The new version was updated to support using different secret groups with Secrests Manager. This only effects Secrets Manager. The net difference is that the legacy secret tool returns the tool name and the secret group name whereas the new tool returns only the tool name."
}

output "sonarqube_tool" {
  value = (var.sonarqube_config == "custom") ? ibm_cd_toolchain_tool_sonarqube.cd_toolchain_tool_sonarqube_instance[0].tool_id : null
}
