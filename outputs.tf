##############################################################################
# Outputs
##############################################################################

output "toolchain_id" {
  value       = ibm_cd_toolchain.toolchain_instance.id
  description = "The CI toolchain ID."
}

output "secrets_manager_instance_id" {
  value       = module.services.sm_instance_guid
  description = "The Secrets Manager instance ID."
}

output "key_protect_instance_id" {
  value       = module.services.kp_instance_guid
  description = "The Key Protect instance ID."
}

output "ci_pipeline_id" {
  value       = try(module.pipeline_ci[0].pipeline_id, "CI pipeline is not created. Have you set `enable_ci_pipeline` to false.")
  description = "The CI pipeline ID."
}

output "pr_pipeline_id" {
  value       = try(module.pipeline_pr[0].pipeline_id, "PR pipeline is not created. Have you set `enable_pr_pipeline` to false.")
  description = "The PR pipeline ID."
}

output "secret_tool" {
  value       = module.integrations.secret_tool
  description = "The secret tool."
}

output "secret_tool_v1" {
  value       = module.integrations.secret_tool_v1
  description = "The legacy secret tool. Used as part of secret references to point to the secret tool integration. This is the legacy version of the secrets tool. The new version was updated to support using different secret groups with Secrests Manager. This only effects Secrets Manager. The net difference is that the legacy secret tool returns the tool name and the secret group name whereas the new tool returns only the tool name."
}

output "private_worker_id" {
  value       = module.integrations.worker_id
  description = "The ID of the pipeline worker."
}

output "inventory_repo_url" {
  value       = module.inventory_repo.repository_url
  description = "The inventory repository instance URL, with details of which artifact has been built and will be deployed."
}



output "issues_repo_url" {
  value       = module.issues_repo.repository_url
  description = "The incident issues repository instance URL, where issues are created when vulnerabilities and CVEs are detected."
}

output "inventory_repo" {
  value       = module.inventory_repo.repository
  description = "The Inventory repo."
  sensitive   = true
}

output "inventory_repo_git_provider" {
  value       = module.inventory_repo.repo_provider
  description = "The inventory repository provider type. Can be 'hostedgit', 'githubconsolidated' etc."
}

output "inventory_repo_git_id" {
  value       = module.inventory_repo.repo_git_id
  description = "The inventory repository Git ID"
}

output "issues_repo" {
  value       = module.issues_repo.repository
  description = "The Issues repo."
  sensitive   = true
}

output "issues_repo_git_provider" {
  value       = module.issues_repo.repo_provider
  description = "The issues repository provider type. Can be 'hostedgit', 'githubconsolidated' etc."
}

output "issues_repo_git_id" {
  value       = module.issues_repo.repo_git_id
  description = "The issues repository Git ID"
}

output "pipeline_repo_url" {
  value       = module.compliance_pipelines_repo.repository_url
  description = "This repository URL contains the tekton definitions for compliance pipelines."
}

output "pipeline_repo_git_provider" {
  value       = module.compliance_pipelines_repo.repo_provider
  description = "The compliance pipeline repository provider type. Can be 'hostedgit', 'githubconsolidated' etc."
}

output "pipeline_repo_git_id" {
  value       = module.compliance_pipelines_repo.repo_git_id
  description = "The compliance pipeline repository Git ID"
}

output "pipeline_config_repo_config_repo_url" {
  value       = try(module.pipeline_config_repo[0].repository_url, "")
  description = "This repository URL contains the tekton definitions for compliance pipelines."
}

output "pipeline_config_repo_git_provider" {
  value       = try(module.pipeline_config_repo[0].repo_provider, "")
  description = "The compliance pipeline repository provider type. Can be 'hostedgit', 'githubconsolidated' etc."
}

output "pipeline_config_repo_git_id" {
  value       = try(module.pipeline_config_repo[0].repo_git_id, "")
  description = "The compliance pipeline repository Git ID"
}

output "app_repo_url" {
  value       = try(module.app_repo[0].repository_url, "Creation of default app repo integration is disabled")
  description = "The app repository instance URL containing an application that can be built and deployed with the reference DevSecOps toolchain templates."
}

output "app_repo_git_provider" {
  value       = try(module.app_repo[0].repo_provider, "Creation of default app repo integration is disabled")
  description = "The app repo provider 'hostedgit', 'githubconsolidated' etc."
}

output "app_repo_branch" {
  value       = local.app_repo_branch
  description = "The branch of the app repo to be used."
}

output "app_repo_git_id" {
  value       = try(module.app_repo[0].repo_git_id, "Creation of default app repo integration is disabled")
  description = "The app repo Git ID."
}

output "toolchain_url" {
  value       = ibm_cd_toolchain.toolchain_instance.ui_href
  description = "The CI toolchain URL."
}
##############################################################################
