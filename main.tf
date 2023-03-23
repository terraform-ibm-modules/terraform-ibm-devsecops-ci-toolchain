data "ibm_resource_group" "resource_group" {
  name = var.toolchain_resource_group
}

resource "ibm_cd_toolchain" "toolchain_instance" {
  name              = var.toolchain_name
  description       = var.toolchain_description
  resource_group_id = data.ibm_resource_group.resource_group.id
}

module "repositories" {
  source = "./repositories"
  depends_on = [module.integrations]
  toolchain_id                           = ibm_cd_toolchain.toolchain_instance.id
  toolchain_region                       = var.toolchain_region
  toolchain_crn                          = ibm_cd_toolchain.toolchain_instance.crn
  app_repo_existing_url                  = var.app_repo_existing_url
  app_repo_existing_branch               = var.app_repo_existing_branch
  app_repo_existing_git_provider         = var.app_repo_existing_git_provider
  app_repo_existing_git_id               = var.app_repo_existing_git_id
  app_repo_clone_from_url                = var.app_repo_clone_from_url
  app_repo_clone_from_branch             = var.app_repo_clone_from_branch
  app_repo_clone_to_git_provider         = var.app_repo_clone_to_git_provider
  app_repo_clone_to_git_id               = var.app_repo_clone_to_git_id
  pipeline_config_repo_existing_url      = var.pipeline_config_repo_existing_url
  pipeline_config_repo_branch            = var.pipeline_config_repo_branch
  pipeline_config_repo_clone_from_url    = var.pipeline_config_repo_clone_from_url
  pipeline_config_repo_auth_type                 = var.pipeline_config_repo_auth_type
  pipeline_config_repo_git_token_secret_name     = var.pipeline_config_repo_git_token_secret_name
  evidence_repo_auth_type                        = var.evidence_repo_auth_type
  evidence_repo_git_token_secret_name            = var.evidence_repo_git_token_secret_name
  issues_repo_auth_type                          = var.issues_repo_auth_type
  issues_repo_git_token_secret_name              = var.issues_repo_git_token_secret_name
  inventory_repo_auth_type                       = var.inventory_repo_auth_type
  inventory_repo_git_token_secret_name           = var.inventory_repo_git_token_secret_name
  app_repo_auth_type                      = var.app_repo_auth_type
  app_repo_git_token_secret_name          = var.app_repo_git_token_secret_name
  compliance_pipeline_repo_auth_type             = var.compliance_pipeline_repo_auth_type
  compliance_pipeline_repo_git_token_secret_name = var.compliance_pipeline_repo_git_token_secret_name
  repositories_prefix                    = var.repositories_prefix
  app_group                              = var.app_group
  pipeline_config_group                  = var.pipeline_config_group
  compliance_pipeline_group              = var.compliance_pipeline_group
  issues_group                           = var.issues_group
  evidence_group                         = var.evidence_group
  inventory_group                        = var.inventory_group
  secret_tool                                    = module.integrations.secret_tool
}

resource "ibm_cd_toolchain_tool_pipeline" "ci_pipeline" {
  toolchain_id = ibm_cd_toolchain.toolchain_instance.id
  parameters {
    name = "ci-pipeline"
  }
}

module "pipeline-ci" {
  source     = "./pipeline-ci"
  depends_on = [module.repositories, module.integrations, module.services]

  ibmcloud_api                          = var.ibmcloud_api
  ibmcloud_api_key                      = var.ibmcloud_api_key
  pipeline_id                            = split("/", ibm_cd_toolchain_tool_pipeline.ci_pipeline.id)[1]
  app_name                               = var.app_name
  cluster_name                           = var.cluster_name
  cluster_namespace                      = var.cluster_namespace
  dev_region                             = var.dev_region
  dev_resource_group                     = var.dev_resource_group
  registry_namespace                     = var.registry_namespace
  registry_region                        = var.registry_region
  signing_key_secret_name                = var.signing_key_secret_name
  cos_api_key_secret_name                = var.cos_api_key_secret_name
  pipeline_ibmcloud_api_key_secret_name  = var.pipeline_ibmcloud_api_key_secret_name
  app_repo_url                           = module.repositories.app_repo_url
  app_repo_branch                        = module.repositories.app_repo_branch
  pipeline_config_repo_existing_url      = var.pipeline_config_repo_existing_url
  pipeline_config_repo_clone_from_url    = var.pipeline_config_repo_clone_from_url
  pipeline_config_repo_branch            = module.repositories.pipeline_config_repo_branch
  pipeline_config_repo                   = module.repositories.pipeline_config_repo
  pipeline_repo_url                      = module.repositories.pipeline_repo_url
  pipeline_config_path                   = var.pipeline_config_path
  evidence_repo_url                      = module.repositories.evidence_repo_url
  inventory_repo_url                     = module.repositories.inventory_repo_url
  issues_repo_url                        = module.repositories.issues_repo_url
  evidence_repo                          = module.repositories.evidence_repo
  inventory_repo                         = module.repositories.inventory_repo
  issues_repo                            = module.repositories.issues_repo
  secret_tool                            = module.integrations.secret_tool
  cos_bucket_name                        = var.cos_bucket_name
  cos_endpoint                           = var.cos_endpoint
  deployment_target                      = var.deployment_target
  code_engine_project                    = var.code_engine_project
  code_engine_region                     = var.code_engine_region
  code_engine_resource_group             = var.code_engine_resource_group
  code_engine_entity_type                = var.code_engine_entity_type
  code_engine_build_strategy             = var.code_engine_build_strategy
  code_engine_source                     = var.code_engine_source
  app_repo_provider_webhook_syntax       = module.repositories.app_repo_provider_webhook_syntax
  compliance_base_image                  = var.compliance_base_image
  pipeline_debug                         = var.pipeline_debug
  opt_in_dynamic_api_scan                = var.opt_in_dynamic_api_scan
  opt_in_dynamic_ui_scan                 = var.opt_in_dynamic_ui_scan
  opt_in_dynamic_scan                    = var.opt_in_dynamic_scan
  opt_out_v1_evidence                    = var.opt_out_v1_evidence
  opt_in_sonar                           = var.opt_in_sonar
  doi_environment                        = var.doi_environment
  cra_generate_cyclonedx_format          = var.cra_generate_cyclonedx_format
  custom_image_tag                       = var.custom_image_tag
  app_version                            = var.app_version
  slack_notifications                    = var.slack_notifications
  sonarqube_config                       = var.sonarqube_config
  doi_toolchain_id_pipeline_property     = var.doi_toolchain_id_pipeline_property
}

resource "ibm_cd_toolchain_tool_pipeline" "pr_pipeline" {
  toolchain_id = ibm_cd_toolchain.toolchain_instance.id
  parameters {
    name = "pr-pipeline"
  }
}

module "pipeline-pr" {
  source     = "./pipeline-pr"
  depends_on = [module.repositories, module.integrations, module.services]

  ibmcloud_api                          = var.ibmcloud_api
  ibmcloud_api_key                      = var.ibmcloud_api_key
  pipeline_ibmcloud_api_key_secret_name  = var.pipeline_ibmcloud_api_key_secret_name
  pipeline_id                            = split("/", ibm_cd_toolchain_tool_pipeline.pr_pipeline.id)[1]
  app_name                               = var.app_name
  app_repo_url                           = module.repositories.app_repo_url
  app_repo_branch                        = module.repositories.app_repo_branch
  pipeline_config_repo_existing_url      = var.pipeline_config_repo_existing_url
  pipeline_config_repo_clone_from_url    = var.pipeline_config_repo_clone_from_url
  pipeline_config_repo_branch            = module.repositories.pipeline_config_repo_branch
  pipeline_config_repo                   = module.repositories.pipeline_config_repo
  pipeline_config_path                   = var.pipeline_config_path
  pipeline_repo_url                      = module.repositories.pipeline_repo_url
  secret_tool                            = module.integrations.secret_tool
  app_repo_provider_webhook_syntax       = module.repositories.app_repo_provider_webhook_syntax
  compliance_base_image                  = var.compliance_base_image
  pipeline_debug                         = var.pipeline_debug
  slack_notifications                    = var.slack_notifications
} 

module "integrations" {
  source     = "./integrations"
  depends_on = [module.services]

  sm_location                   = var.sm_location
  toolchain_id                  = ibm_cd_toolchain.toolchain_instance.id
  sm_resource_group             = var.sm_resource_group
  sm_name                       = var.sm_name
  sm_instance_guid              = module.services.sm_instance_guid
  sm_secret_group               = var.sm_secret_group
  kp_location                   = var.kp_location
  kp_resource_group             = var.kp_resource_group
  kp_name                       = var.kp_name
  kp_instance_guid              = module.services.kp_instance_guid
  enable_secrets_manager        = var.enable_secrets_manager
  enable_key_protect            = var.enable_key_protect
  enable_slack                  = var.enable_slack
  slack_webhook_secret_name     = var.slack_webhook_secret_name
  slack_channel_name            = var.slack_channel_name
  slack_team_name               = var.slack_team_name
  slack_pipeline_fail           = var.slack_pipeline_fail
  slack_pipeline_start          = var.slack_pipeline_start
  slack_pipeline_success        = var.slack_pipeline_success
  slack_toolchain_bind          = var.slack_toolchain_bind
  slack_toolchain_unbind        = var.slack_toolchain_unbind
  authorization_policy_creation = var.authorization_policy_creation
  link_to_doi_toolchain         = var.link_to_doi_toolchain
  doi_toolchain_id              = var.doi_toolchain_id
  secret_tool                   = module.integrations.secret_tool
}

module "services" {
  source = "./services"

  sm_name                 = var.sm_name
  sm_location             = var.sm_location
  sm_resource_group       = var.sm_resource_group
  kp_name                 = var.kp_name
  kp_location             = var.kp_location
  kp_resource_group       = var.kp_resource_group
  enable_secrets_manager  = var.enable_secrets_manager
  enable_key_protect      = var.enable_key_protect
  cluster_name            = var.cluster_name
  cluster_namespace       = var.cluster_namespace
  registry_namespace      = var.registry_namespace
  registry_region         = var.registry_region
}

output "toolchain_id" {
  value = ibm_cd_toolchain.toolchain_instance.id
}

output "secrets_manager_instance_id" {
  value = module.services.sm_instance_guid
}

output "key_protect_instance_id" {
  value = module.services.kp_instance_guid
}

output "ci_pipeline_id" {
  value = module.pipeline-ci.pipeline_id
}

output "pr_pipeline_id" {
  value = module.pipeline-pr.pipeline_id
}

output "secret_tool" {
  value = module.integrations.secret_tool
}

output "inventory_repo_url" {
  value       = module.repositories.inventory_repo_url
  description = "The inventory repository instance url, with details of which artifact has been built and will be deployed"
}

output "evidence_repo_url" {
  value       = module.repositories.evidence_repo_url
  description = "The evidence repository instance url, where evidence of the builds and scans are stored, ready for any compliance audit"
}

output "issues_repo_url" {
  value       = module.repositories.issues_repo_url
  description = "The incident issues repository instance url, where issues are created when vulnerabilities and CVEs are detected"
}

output "inventory_repo" {
  value     = module.repositories.inventory_repo
  sensitive = true
}

output "evidence_repo" {
  value     = module.repositories.evidence_repo
  sensitive = true
}

output "issues_repo" {
  value     = module.repositories.issues_repo
  sensitive = true
}

output "pipeline_repo_url" {
  value       = module.repositories.pipeline_repo_url
  description = "This repository url contains the tekton definitions for compliance pipelines"
}

output "app_repo_url" {
  value       = module.repositories.app_repo_url
  description = "The app repository instance url containing an application that can be built and deployed with the reference DevSecOps toolchain templates."
}

output "app_repo_git_provider" {
  value       = module.repositories.app_repo_git_provider
  description = "The app repo provider 'hostedgit', 'githubconsolidated' etc"
}

output "app_repo_branch" {
  value = module.repositories.app_repo_branch
  description = "The branch of the app repo to be used"
}

output "app_repo_git_id" {
  value =  module.repositories.app_repo_git_id
}
