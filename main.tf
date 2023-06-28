locals {

  is_staging = length(regexall("^crn:v1:staging:.*$", ibm_cd_toolchain.toolchain_instance.crn)) > 0
  git_dev   = "https://dev.us-south.git.test.cloud.ibm.com"
  git_mon01 = "https://mon01.git.cloud.ibm.com"
  git_fr2   = "https://private.eu-fr2.git.cloud.ibm.com"
  compliance_pipelines_git_server = (
    (local.is_staging) ? local.git_dev
    : (var.toolchain_region == "eu-fr2") ? local.git_fr2
    : format("https://%s.git.cloud.ibm.com", var.toolchain_region)
  )
  # in dev/staging, compliance_pipelines_git_server is dev and clone_from_git_server is mon01
  clone_from_git_server = (
    (local.is_staging) ? local.git_mon01 : local.compliance_pipelines_git_server
  )

  #issues_source_repo_url = (
  #  (var.issues_source_repo_url != "") ? var.issues_source_repo_url :
  #  (var.issues_repo_clone_from_url != "") ? var.issues_repo_clone_from_url :
  #  format("%s/open-toolchain/compliance-incident-issues.git", local.clone_from_git_server))

  #evidence_source_repo_url = (
  #  (var.evidence_source_repo_url != "") ? var.evidence_source_repo_url :
  #  (var.evidence_repo_clone_from_url != "") ? var.evidence_repo_clone_from_url :
  #  format("%s/open-toolchain/compliance-evidence-locker.git", local.clone_from_git_server))

  #inventory_source_repo_url = (
  #  (var.inventory_source_repo_url != "") ? var.inventory_source_repo_url :
  #  (var.inventory_repo_clone_from_url != "") ? var.inventory_repo_clone_from_url :
  #  format("%s/open-toolchain/compliance-inventory.git", local.clone_from_git_server))
  issues_source_repo_url = "https://eu-gb.git.cloud.ibm.com/open-toolchain/compliance-incident-issues.git"
  evidence_source_repo_url = "https://eu-gb.git.cloud.ibm.com/open-toolchain/compliance-evidence-locker.git"
  inventory_source_repo_url = "https://eu-gb.git.cloud.ibm.com/open-toolchain/compliance-inventory.git"
  compliance_repo_url = format("%s/open-toolchain/compliance-pipelines.git", local.compliance_pipelines_git_server)

}

data "ibm_resource_group" "resource_group" {
  name = var.toolchain_resource_group
}

resource "ibm_cd_toolchain" "toolchain_instance" {
  name              = var.toolchain_name
  description       = var.toolchain_description
  resource_group_id = data.ibm_resource_group.resource_group.id
}

module "repositories" {
  source                                         = "./repositories"
  depends_on                                     = [module.integrations]
  toolchain_id                                   = ibm_cd_toolchain.toolchain_instance.id
  toolchain_region                               = var.toolchain_region
  toolchain_crn                                  = ibm_cd_toolchain.toolchain_instance.crn
  app_repo_existing_url                          = var.app_repo_existing_url
  app_repo_existing_branch                       = var.app_repo_existing_branch
  app_repo_existing_git_provider                 = var.app_repo_existing_git_provider
  app_repo_existing_git_id                       = var.app_repo_existing_git_id
  app_repo_clone_from_url                        = var.app_repo_clone_from_url
  app_repo_clone_from_branch                     = var.app_repo_clone_from_branch
  app_repo_clone_to_git_provider                 = var.app_repo_clone_to_git_provider
  app_repo_clone_to_git_id                       = var.app_repo_clone_to_git_id
  app_repo_template_url                          = var.app_repo_template_url
  pipeline_config_repo_git_provider              = var.pipeline_config_repo_git_provider
  pipeline_config_repo_existing_url              = var.pipeline_config_repo_existing_url
  pipeline_config_repo_branch                    = var.pipeline_config_repo_branch
  pipeline_config_repo_clone_from_url            = var.pipeline_config_repo_clone_from_url
  pipeline_repo_url                              = var.pipeline_repo_url
  pipeline_config_repo_auth_type                 = var.pipeline_config_repo_auth_type
  pipeline_config_repo_git_token_secret_name     = var.pipeline_config_repo_git_token_secret_name
  evidence_repo_git_provider                     = var.evidence_repo_git_provider
  evidence_source_repo_url                       = var.evidence_source_repo_url
  evidence_repo_auth_type                        = var.evidence_repo_auth_type
  evidence_repo_git_token_secret_name            = var.evidence_repo_git_token_secret_name
  issues_repo_git_provider                       = var.issues_repo_git_provider
  issues_source_repo_url                         = var.issues_source_repo_url
  issues_repo_auth_type                          = var.issues_repo_auth_type
  issues_repo_git_token_secret_name              = var.issues_repo_git_token_secret_name
  inventory_repo_git_provider                    = var.inventory_repo_git_provider
  inventory_source_repo_url                      = var.inventory_source_repo_url
  inventory_repo_auth_type                       = var.inventory_repo_auth_type
  inventory_repo_git_token_secret_name           = var.inventory_repo_git_token_secret_name
  app_repo_auth_type                             = var.app_repo_auth_type
  app_repo_git_token_secret_name                 = var.app_repo_git_token_secret_name
  compliance_pipeline_repo_git_provider          = var.compliance_pipeline_repo_git_provider
  compliance_pipeline_repo_auth_type             = var.compliance_pipeline_repo_auth_type
  compliance_pipeline_repo_git_token_secret_name = var.compliance_pipeline_repo_git_token_secret_name
  repositories_prefix                            = var.repositories_prefix
  app_group                                      = var.app_group
  pipeline_config_group                          = var.pipeline_config_group
  compliance_pipeline_group                      = var.compliance_pipeline_group
  issues_group                                   = var.issues_group
  evidence_group                                 = var.evidence_group
  inventory_group                                = var.inventory_group
  secret_tool                                    = module.integrations.secret_tool
  default_git_provider                           = var.default_git_provider
  issues_repo_integration_owner                  = var.issues_repo_integration_owner
  evidence_repo_integration_owner                = var.evidence_repo_integration_owner
  inventory_repo_integration_owner               = var.inventory_repo_integration_owner
  pipeline_repo_integration_owner                = var.pipeline_repo_integration_owner
  config_repo_integration_owner                  = var.config_repo_integration_owner
  app_repo_integration_owner                     = var.app_repo_integration_owner
}

module "issues_repo" {
  source                                         = "./repos"
  depends_on                                     = [module.integrations]
  tool_name                                      = "issues-repo"
  toolchain_id                                   = ibm_cd_toolchain.toolchain_instance.id
  git_provider                                   = var.issues_repo_git_provider
  initilization_type                             = var.issues_repo_initilization_type
  repository_url                                 = var.issues_repo_existing_url
  source_repository_url                          = local.issues_source_repo_url
  repository_name                                = (var.issues_repo_name != "") ? var.issues_repo_name : join("-", [var.repositories_prefix, "issues-repo"])
  is_private_repo                                = var.issues_repo_is_private_repo
  owner_id                                       = var.issues_group
  issues_enabled                                 = var.issues_repo_issues_enabled
  traceability_enabled                           = var.issues_repo_traceability_enabled
  integration_owner                              = var.issues_repo_integration_owner
  auth_type                                      = var.issues_repo_auth_type
  git_token                                      = var.issues_repo_git_token_secret_name
  git_id                                         = var.issues_repo_git_id
}

module "evidence_repo" {
  source                                         = "./repos"
  depends_on                                     = [module.integrations]
  tool_name                                      = "evidence-repo"
  toolchain_id                                   = ibm_cd_toolchain.toolchain_instance.id
  git_provider                                   = var.evidence_repo_git_provider
  initilization_type                             = var.evidence_repo_initilization_type
  repository_url                                 = var.evidence_repo_existing_url
  source_repository_url                          = local.evidence_source_repo_url
  repository_name                                = (var.evidence_repo_name != "") ? var.evidence_repo_name : join("-", [var.repositories_prefix, "evidence-repo"])
  is_private_repo                                = var.evidence_repo_is_private_repo
  owner_id                                       = var.evidence_group
  issues_enabled                                 = var.evidence_repo_issues_enabled
  traceability_enabled                           = var.evidence_repo_traceability_enabled
  integration_owner                              = var.evidence_repo_integration_owner
  auth_type                                      = var.evidence_repo_auth_type
  git_token                                      = var.evidence_repo_git_token_secret_name
  git_id                                         = var.evidence_repo_git_id
}

module "inventory_repo" {
  source                                         = "./repos"
  depends_on                                     = [module.integrations]
  tool_name                                      = "inventory-repo"
  toolchain_id                                   = ibm_cd_toolchain.toolchain_instance.id
  git_provider                                   = var.inventory_repo_git_provider
  initilization_type                             = var.inventory_repo_initilization_type
  repository_url                                 = var.inventory_repo_existing_url
  source_repository_url                          = local.inventory_source_repo_url
  repository_name                                = (var.inventory_repo_name != "") ? var.inventory_repo_name : join("-", [var.repositories_prefix, "inventory-repo"])
  is_private_repo                                = var.inventory_repo_is_private_repo
  owner_id                                       = var.inventory_group
  issues_enabled                                 = var.inventory_repo_issues_enabled
  traceability_enabled                           = var.inventory_repo_traceability_enabled
  integration_owner                              = var.inventory_repo_integration_owner
  auth_type                                      = var.inventory_repo_auth_type
  git_token                                      = var.inventory_repo_git_token_secret_name
  git_id                                         = var.inventory_repo_git_id
}

resource "ibm_cd_toolchain_tool_pipeline" "ci_pipeline" {
  toolchain_id = ibm_cd_toolchain.toolchain_instance.id
  parameters {
    name = "ci-pipeline"
  }
}

module "pipeline_ci" {
  source     = "./pipeline-ci"
  depends_on = [module.repositories, module.integrations, module.services]

  ibmcloud_api                          = var.ibmcloud_api
  ibmcloud_api_key                      = var.ibmcloud_api_key
  pipeline_id                           = split("/", ibm_cd_toolchain_tool_pipeline.ci_pipeline.id)[1]
  app_name                              = var.app_name
  cluster_name                          = var.cluster_name
  cluster_namespace                     = var.cluster_namespace
  dev_region                            = var.dev_region
  dev_resource_group                    = var.dev_resource_group
  registry_namespace                    = var.registry_namespace
  registry_region                       = var.registry_region
  signing_key_secret_name               = var.signing_key_secret_name
  cos_api_key_secret_name               = var.cos_api_key_secret_name
  pipeline_ibmcloud_api_key_secret_name = var.pipeline_ibmcloud_api_key_secret_name
  app_repo_url                          = module.repositories.app_repo_url
  app_repo_branch                       = module.repositories.app_repo_branch
  pipeline_config_repo_existing_url     = var.pipeline_config_repo_existing_url
  pipeline_config_repo_clone_from_url   = var.pipeline_config_repo_clone_from_url
  pipeline_config_repo_branch           = module.repositories.pipeline_config_repo_branch
  pipeline_config_repo                  = module.repositories.pipeline_config_repo
  pipeline_repo_url                     = module.repositories.pipeline_repo_url
  pipeline_config_path                  = var.pipeline_config_path
  evidence_repo_url                     = module.evidence_repo.repository_url
  inventory_repo_url                    = module.inventory_repo.repository_url
  issues_repo_url                       = module.issues_repo.repository_url
  evidence_repo                         = module.evidence_repo.repository
  inventory_repo                        = module.inventory_repo.repository
  issues_repo                           = module.issues_repo.repository
  secret_tool                           = module.integrations.secret_tool
  cos_bucket_name                       = var.cos_bucket_name
  cos_endpoint                          = var.cos_endpoint
  deployment_target                     = var.deployment_target
  code_engine_project                   = var.code_engine_project
  code_engine_region                    = var.code_engine_region
  code_engine_resource_group            = var.code_engine_resource_group
  code_engine_entity_type               = var.code_engine_entity_type
  code_engine_build_strategy            = var.code_engine_build_strategy
  code_engine_source                    = var.code_engine_source
  app_repo_provider_webhook_syntax      = module.repositories.app_repo_provider_webhook_syntax
  compliance_base_image                 = var.compliance_base_image
  pipeline_debug                        = var.pipeline_debug
  opt_in_dynamic_api_scan               = var.opt_in_dynamic_api_scan
  opt_in_dynamic_ui_scan                = var.opt_in_dynamic_ui_scan
  opt_in_dynamic_scan                   = var.opt_in_dynamic_scan
  opt_out_v1_evidence                   = var.opt_out_v1_evidence
  opt_in_sonar                          = var.opt_in_sonar
  doi_environment                       = var.doi_environment
  cra_generate_cyclonedx_format         = var.cra_generate_cyclonedx_format
  custom_image_tag                      = var.custom_image_tag
  app_version                           = var.app_version
  slack_notifications                   = var.slack_notifications
  sonarqube_config                      = var.sonarqube_config
  doi_toolchain_id_pipeline_property    = var.doi_toolchain_id_pipeline_property
  enable_pipeline_dockerconfigjson      = var.enable_pipeline_dockerconfigjson
  pipeline_dockerconfigjson_secret_name = var.pipeline_dockerconfigjson_secret_name
  private_worker                        = module.integrations.private_worker
  enable_privateworker                  = var.enable_privateworker
  enable_artifactory                    = var.enable_artifactory
  tool_artifactory                      = module.integrations.ibm_cd_toolchain_tool_artifactory
  ci_pipeline_branch                    = var.ci_pipeline_branch
}

resource "ibm_cd_toolchain_tool_pipeline" "pr_pipeline" {
  toolchain_id = ibm_cd_toolchain.toolchain_instance.id
  parameters {
    name = "pr-pipeline"
  }
}

module "pipeline_pr" {
  source     = "./pipeline-pr"
  depends_on = [module.repositories, module.integrations, module.services]

  ibmcloud_api                          = var.ibmcloud_api
  ibmcloud_api_key                      = var.ibmcloud_api_key
  pipeline_ibmcloud_api_key_secret_name = var.pipeline_ibmcloud_api_key_secret_name
  pipeline_id                           = split("/", ibm_cd_toolchain_tool_pipeline.pr_pipeline.id)[1]
  app_name                              = var.app_name
  app_repo_url                          = module.repositories.app_repo_url
  app_repo_branch                       = module.repositories.app_repo_branch
  pipeline_config_repo_existing_url     = var.pipeline_config_repo_existing_url
  pipeline_config_repo_clone_from_url   = var.pipeline_config_repo_clone_from_url
  pipeline_config_repo_branch           = module.repositories.pipeline_config_repo_branch
  pipeline_config_repo                  = module.repositories.pipeline_config_repo
  pipeline_config_path                  = var.pipeline_config_path
  pipeline_repo_url                     = module.repositories.pipeline_repo_url
  secret_tool                           = module.integrations.secret_tool
  app_repo_provider_webhook_syntax      = module.repositories.app_repo_provider_webhook_syntax
  compliance_base_image                 = var.compliance_base_image
  pipeline_debug                        = var.pipeline_debug
  slack_notifications                   = var.slack_notifications
  enable_pipeline_dockerconfigjson      = var.enable_pipeline_dockerconfigjson
  pipeline_dockerconfigjson_secret_name = var.pipeline_dockerconfigjson_secret_name
  tool_artifactory                      = module.integrations.ibm_cd_toolchain_tool_artifactory
  enable_artifactory                    = var.enable_artifactory
  pr_pipeline_branch                    = var.pr_pipeline_branch

}

module "integrations" {
  source     = "./integrations"
  depends_on = [module.services]

  sm_location                           = var.sm_location
  toolchain_id                          = ibm_cd_toolchain.toolchain_instance.id
  sm_resource_group                     = var.sm_resource_group
  sm_name                               = var.sm_name
  sm_instance_guid                      = module.services.sm_instance_guid
  sm_secret_group                       = var.sm_secret_group
  kp_location                           = var.kp_location
  kp_resource_group                     = var.kp_resource_group
  kp_name                               = var.kp_name
  kp_instance_guid                      = module.services.kp_instance_guid
  enable_secrets_manager                = var.enable_secrets_manager
  enable_key_protect                    = var.enable_key_protect
  enable_slack                          = var.enable_slack
  slack_webhook_secret_name             = var.slack_webhook_secret_name
  slack_channel_name                    = var.slack_channel_name
  slack_team_name                       = var.slack_team_name
  slack_pipeline_fail                   = var.slack_pipeline_fail
  slack_pipeline_start                  = var.slack_pipeline_start
  slack_pipeline_success                = var.slack_pipeline_success
  slack_toolchain_bind                  = var.slack_toolchain_bind
  slack_toolchain_unbind                = var.slack_toolchain_unbind
  authorization_policy_creation         = var.authorization_policy_creation
  link_to_doi_toolchain                 = var.link_to_doi_toolchain
  doi_toolchain_id                      = var.doi_toolchain_id
  secret_tool                           = module.integrations.secret_tool
  enable_artifactory                    = var.enable_artifactory
  artifactory_dashboard_url             = var.artifactory_dashboard_url
  artifactory_user                      = var.artifactory_user
  artifactory_repo_name                 = var.artifactory_repo_name
  artifactory_repo_url                  = var.artifactory_repo_url
  enable_privateworker                  = var.enable_privateworker
  privateworker_credentials_secret_name = var.privateworker_credentials_secret_name
  artifactory_token_secret_name         = var.artifactory_token_secret_name

}

module "services" {
  source = "./services"

  sm_name                = var.sm_name
  sm_location            = var.sm_location
  sm_resource_group      = var.sm_resource_group
  kp_name                = var.kp_name
  kp_location            = var.kp_location
  kp_resource_group      = var.kp_resource_group
  enable_secrets_manager = var.enable_secrets_manager
  enable_key_protect     = var.enable_key_protect
  cluster_name           = var.cluster_name
  cluster_namespace      = var.cluster_namespace
  registry_namespace     = var.registry_namespace
  registry_region        = var.registry_region
}
