data "ibm_resource_group" "resource_group" {
  name = var.resource_group
}

resource "ibm_cd_toolchain" "toolchain_instance" {
  name              = var.toolchain_name
  description       = var.toolchain_description
  resource_group_id = data.ibm_resource_group.resource_group.id
}

module "repositories" {
  source                          = "./repositories"
  toolchain_id                    = ibm_cd_toolchain.toolchain_instance.id
  resource_group                  = data.ibm_resource_group.resource_group.id  
  ibm_cloud_api_key               = var.ibm_cloud_api_key
  region                          = var.region  
  app_repo                        = var.app_repo
  pipeline_repo                   = var.pipeline_repo
  evidence_repo                   = var.evidence_repo
  inventory_repo                  = var.inventory_repo
  issues_repo                     = var.issues_repo
  repositories_prefix             = var.app_name  
}

resource "ibm_cd_toolchain_tool_pipeline" "ci_pipeline" {
  toolchain_id = ibm_cd_toolchain.toolchain_instance.id
  parameters {
    name = "ci-pipeline"
  }
}

module "pipeline-ci" {
  source                    = "./pipeline-ci"
  depends_on                = [ module.repositories, module.integrations, module.services ]
  ibm_cloud_api             = var.ibm_cloud_api
  ibm_cloud_api_key         = var.ibm_cloud_api_key
  region                    = var.region
  pipeline_id               = split("/", ibm_cd_toolchain_tool_pipeline.ci_pipeline.id)[1]
  resource_group            = var.resource_group
  app_name                  = var.app_name
  app_image_name            = var.app_image_name  
  cluster_name              = var.cluster_name
  cluster_namespace         = var.cluster_namespace
  cluster_region            = var.cluster_region
  registry_namespace        = var.registry_namespace
  registry_region           = var.registry_region
  app_repo                  = module.repositories.app_repo_url 
  pipeline_repo             = module.repositories.pipeline_repo_url 
  evidence_repo             = module.repositories.evidence_repo_url 
  inventory_repo            = module.repositories.inventory_repo_url 
  issues_repo               = module.repositories.issues_repo_url 
  sm_integration_name       = module.integrations.secretsmanager_integration_name
  sm_group                  = var.sm_group
  cos_bucket_name           = var.cos_bucket_name
  cos_api_key               = var.cos_api_key
  cos_endpoint              = var.cos_endpoint
}

resource "ibm_cd_toolchain_tool_pipeline" "pr_pipeline" {
  toolchain_id = ibm_cd_toolchain.toolchain_instance.id
  parameters {
    name = "pr-pipeline"
  }
}

module "pipeline-pr" {
  source                   = "./pipeline-pr"
  depends_on               = [ module.repositories, module.integrations, module.services ]
  ibm_cloud_api            = var.ibm_cloud_api
  ibm_cloud_api_key        = var.ibm_cloud_api_key
  region                   = var.region  
  pipeline_id              = split("/", ibm_cd_toolchain_tool_pipeline.pr_pipeline.id)[1]
  resource_group           = var.resource_group
  app_name                 = var.app_name
  app_repo                 = module.repositories.app_repo_url 
  pipeline_repo            = module.repositories.pipeline_repo_url 
  sm_integration_name      = module.integrations.secretsmanager_integration_name
  sm_group                 = var.sm_group  
}

module "integrations" {
  source                    = "./integrations"
  depends_on                = [ module.repositories, module.services ]  
  region                    = var.sm_region  
  toolchain_id              = ibm_cd_toolchain.toolchain_instance.id
  resource_group            = var.resource_group
  secrets_manager_instance_name = module.services.secrets_manager_instance_name
  secrets_manager_instance_guid = module.services.secrets_manager_instance_guid
  slack_channel_name        = var.slack_channel_name
  slack_api_token           = var.slack_api_token
  slack_user_name           = var.slack_user_name
}

module "services" {
  source                    = "./services"
  secrets_manager_instance_name = var.sm_name
  region                    = var.sm_region
  ibm_cloud_api             = var.ibm_cloud_api   
  cluster_name              = var.cluster_name
  cluster_namespace         = var.cluster_namespace
  cluster_region            = var.cluster_region
  registry_namespace        = var.registry_namespace
  registry_region           = var.registry_region
  sm_resource_group         = var.resource_group
  }

output "toolchain_id" {
  value = ibm_cd_toolchain.toolchain_instance.id
}

output "secrets_manager_instance_id" {
  value = module.services.secrets_manager_instance_guid
}