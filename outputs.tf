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
  value       = module.pipeline_ci.pipeline_id
  description = "The CI pipeline ID."
}

output "pr_pipeline_id" {
  value       = module.pipeline_pr.pipeline_id
  description = "The PR pipeline ID."
}

output "secret_tool" {
  value       = module.integrations.secret_tool
  description = "The secret tool."
}

output "inventory_repo_url" {
  value       = module.inventory_repo.repository_url
  description = "The inventory repository instance URL, with details of which artifact has been built and will be deployed."
}

output "evidence_repo_url" {
  value       = module.evidence_repo.repository_url
  description = "The evidence repository instance URL, where evidence of the builds and scans are stored, ready for any compliance audit."
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

output "evidence_repo" {
  value       = module.evidence_repo.repository
  description = "The Evidence repo."
  sensitive   = true
}

output "issues_repo" {
  value       = module.issues_repo.repository
  description = "The Issues repo."
  sensitive   = true
}

output "pipeline_repo_url" {
  value       = module.compliance_pipelines_repo.repository_url
  description = "This repository URL contains the tekton definitions for compliance pipelines."
}

output "app_repo_url" {
  value       = module.repositories.app_repo_url
  description = "The app repository instance URL containing an application that can be built and deployed with the reference DevSecOps toolchain templates."
}

output "app_repo_git_provider" {
  value       = module.repositories.app_repo_git_provider
  description = "The app repo provider 'hostedgit', 'githubconsolidated' etc."
}

output "app_repo_branch" {
  value       = module.repositories.app_repo_branch
  description = "The branch of the app repo to be used."
}

output "app_repo_git_id" {
  value       = module.repositories.app_repo_git_id
  description = "The app repo Git ID."
}

##############################################################################
