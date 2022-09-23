resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_config" {
  name           = "pipeline-config"
  type           = "TEXT"
  value          = ".pipeline-config.yaml"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_config_branch" {
  name           = "pipeline-config-branch"
  type           = "TEXT"
  value          = "master"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_config_repo" {
  name           = "pipeline-config-repo"
  type           = "TEXT"
  value          = " "
  pipeline_id    = var.pipeline_id          
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_debug" {
  name           = "pipeline-debug"
  type           = "TEXT"
  value          = "0"
  pipeline_id    = var.pipeline_id          
}

# resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_pipeline_dockerconfigjson" {
#   name           = "pipeline-dockerconfigjson"
#   type           = "SECURE"
#   value          = " "
#   pipeline_id    = var.pipeline_id          
# }

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_slack_notifications" {
  name           = "slack-notifications"
  type           = "TEXT"
  value          = "1"
  pipeline_id    = var.pipeline_id          
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_ibmcloud_api_key" {
  name           = "ibmcloud-api-key"
  type           = "SECURE"
  value          = format("{vault::%s.ibmcloud-api-key}", var.kp_integration_name)
  pipeline_id    = var.pipeline_id          
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_evidence_repo" {
  name           = "evidence-repo"
  type           = "TEXT"
  value          = var.evidence_repo
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id       
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_inventory_repo" {
  name           = "inventory-repo"
  type           = "TEXT"
  value          = var.inventory_repo
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id       
}

// Limitation with issues repository url: How to fetch issues repository url 
// as it is created internally while creating application repository resource
resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_issues_repo" {
  name           = "incident-repo"
  type           = "TEXT"
  value          = var.issues_repo
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id   
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_cluster_name" {
  name           = "cluster-name"
  type           = "TEXT"
  value          = var.cluster_name
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id        
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_dev_cluster_namespace" {
  name           = "dev-cluster-namespace"
  type           = "TEXT"
  value          = var.cluster_namespace
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id      
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_dev_region" {
  name           = "dev-region"
  type           = "TEXT"
  value          = var.cluster_region
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id       
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_dev_resource_group" {
  name           = "dev-resource-group"
  type           = "TEXT"
  value          = var.resource_group
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_registry_namespace" {
  name           = "registry-namespace"
  type           = "TEXT"
  value          = var.registry_namespace
  pipeline_id    =ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_registry_region" {
  name           = "registry-region"
  type           = "TEXT"
  value          = var.registry_region
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

# resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_cos_api_key" {
#   name           = "cos-api-key"
#   type           = "SECURE"
#   value          = ""
#   pipeline_id    = var.pipeline_id                   
# }

# resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_cos_bucket_name" {
#   name           = "cos-bucket-name"
#   type           = "TEXT"
#   value          = ""
#   pipeline_id    = var.pipeline_id                   
# }

# resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_cos_endpoint" {
#   name           = "cos-endpoint"
#   type           = "TEXT"
#   value          = ""
#   pipeline_id    = var.pipeline_id                   
# }

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_doi_environment" {
  name           = "opt-in-dynamic-api-scan"
  type           = "TEXT"
  value          = "1"
  pipeline_id    = var.pipeline_id                   
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_doi_environment" {
  name           = "opt-in-dynamic-ui-scan"
  type           = "TEXT"
  value          = "1"
  pipeline_id    = var.pipeline_id                   
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_doi_environment" {
  name           = "opt-in-dynamic-scan"
  type           = "TEXT"
  value          = "1"
  pipeline_id    = var.pipeline_id                   
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_doi_environment" {
  name           = "opt-in-sonar"
  type           = "TEXT"
  value          = "1"
  pipeline_id    = var.pipeline_id                   
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_doi_environment" {
  name           = "git-token"
  type           = "TEXT"
  value          = " "
  pipeline_id    = var.pipeline_id                   
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_doi_environment" {
  name           = "doi-environment"
  type           = "TEXT"
  value          = " "
  pipeline_id    = var.pipeline_id                   
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_doi_toolchain_id" {
  name           = "doi-toolchain-id"
  type           = "TEXT"
  value          = " "
  pipeline_id    = var.pipeline_id                   
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_signing_key" {
  name           = "signing-key"
  type           = "SECURE"
  value          = format("{vault::%s.signing-key}", var.kp_integration_name)
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_app_name" {
  name           = "app-name"
  type           = "TEXT"
  value          = var.app_name
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_ibm_cloud_api" {
  name           = "ibmcloud-api"
  type           = "TEXT"
  value          = var.ibm_cloud_api
  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_manual_trigger_property_app_name" {
   name           = "app-name"
   type           = "TEXT"
   value          = "hello-compliance-app"
   pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
   trigger_id     = ibm_cd_tekton_pipeline_trigger.ci_pipeline_manual_trigger.trigger[0].id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "ci_pipeline_manual_trigger_property_repository" {
   name           = "repository"
   type           = "TEXT"
   value          = var.app_repo
   pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
   trigger_id     = ibm_cd_tekton_pipeline_trigger.ci_pipeline_manual_trigger.trigger[0].id
}

# resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_sonarqube" {
#   name           = "sonarqube"
#   type           = "INTEGRATION"
#   integration_id = ""
#   pipeline_id    = var.pipeline_id               
# }