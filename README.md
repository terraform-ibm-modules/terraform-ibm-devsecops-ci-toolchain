<!-- BEGIN MODULE HOOK -->

<!-- Update the title to match the module name and add a description -->
## Terraform DevSecOps CI Toolchain
<!-- UPDATE BADGE: Update the link for the following badge-->

A Terraform module for provisioning the DevSecOps CI toolchain

<!-- Remove the content in this H2 heading after completing the steps -->
<!-- Remove the content in this previous H2 heading -->

## Reference architectures

## Usage

```hcl
module "terraform_devsecops_alm" {
  source                   = "git::https://github.com/terraform-ibm-modules/terraform-ibm-devsecops-ci-toolchain?ref=v1.0.7"
  toolchain_region         = var.toolchain_region
  toolchain_resource_group = var.toolchain_resource_group
  registry_namespace       = var.registry_namespace
  sm_resource_group        = var.sm_resource_group
  sm_name                  = var.sm_name
  sm_location              = var.sm_location
  sm_secret_group          = var.sm_secret_group
  cluster_name             = var.cluster_name
  cluster_namespace        = var.cluster_namespace
  dev_region               = var.dev_region
  dev_resource_group       = var.dev_resource_group
}

```

## Required IAM access policies

<!-- NO PERMISSIONS FOR MODULE
If no permissions are required for the module, uncomment the following
statement instead the previous block.
-->

<!-- No permissions are needed to run this module.-->
<!-- END MODULE HOOK -->
<!-- BEGIN EXAMPLES HOOK -->
## Examples

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_repo"></a> [app\_repo](#module\_app\_repo) | ./repos | n/a |
| <a name="module_compliance_pipelines_repo"></a> [compliance\_pipelines\_repo](#module\_compliance\_pipelines\_repo) | ./repos | n/a |
| <a name="module_evidence_repo"></a> [evidence\_repo](#module\_evidence\_repo) | ./repos | n/a |
| <a name="module_integrations"></a> [integrations](#module\_integrations) | ./integrations | n/a |
| <a name="module_inventory_repo"></a> [inventory\_repo](#module\_inventory\_repo) | ./repos | n/a |
| <a name="module_issues_repo"></a> [issues\_repo](#module\_issues\_repo) | ./repos | n/a |
| <a name="module_pipeline_ci"></a> [pipeline\_ci](#module\_pipeline\_ci) | ./pipeline-ci | n/a |
| <a name="module_pipeline_config_repo"></a> [pipeline\_config\_repo](#module\_pipeline\_config\_repo) | ./repos | n/a |
| <a name="module_pipeline_pr"></a> [pipeline\_pr](#module\_pipeline\_pr) | ./pipeline-pr | n/a |
| <a name="module_services"></a> [services](#module\_services) | ./services | n/a |

## Resources

| Name | Type |
|------|------|
| [ibm_cd_toolchain.toolchain_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/cd_toolchain) | resource |
| [ibm_cd_toolchain_tool_pipeline.ci_pipeline](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/cd_toolchain_tool_pipeline) | resource |
| [ibm_cd_toolchain_tool_pipeline.pr_pipeline](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/cd_toolchain_tool_pipeline) | resource |
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_group"></a> [app\_group](#input\_app\_group) | Specify Git user/group for your application. | `string` | `""` | no |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Name of the application image and inventory entry. | `string` | `"hello-compliance-app"` | no |
| <a name="input_app_repo_auth_type"></a> [app\_repo\_auth\_type](#input\_app\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_app_repo_clone_from_branch"></a> [app\_repo\_clone\_from\_branch](#input\_app\_repo\_clone\_from\_branch) | Used when app\_repo\_clone\_from\_url is provided, the default branch that will be used by the CI build, usually either main or master. | `string` | `""` | no |
| <a name="input_app_repo_clone_from_url"></a> [app\_repo\_clone\_from\_url](#input\_app\_repo\_clone\_from\_url) | Override the default sample app by providing your own sample app URL, which will be cloned into the app repo. Note, using clone\_if\_not\_exists mode, so if the app repo already exists the repo contents are unchanged. | `string` | `""` | no |
| <a name="input_app_repo_clone_to_git_id"></a> [app\_repo\_clone\_to\_git\_id](#input\_app\_repo\_clone\_to\_git\_id) | Custom server GUID, or other options for 'git\_id' field in the browser UI. | `string` | `""` | no |
| <a name="input_app_repo_clone_to_git_provider"></a> [app\_repo\_clone\_to\_git\_provider](#input\_app\_repo\_clone\_to\_git\_provider) | By default 'hostedgit', else use 'githubconsolidated' or 'gitlab'. | `string` | `""` | no |
| <a name="input_app_repo_existing_branch"></a> [app\_repo\_existing\_branch](#input\_app\_repo\_existing\_branch) | Used when app\_repo\_existing\_url is provided, the default branch that will be used by the CI build, usually either main or master. | `string` | `""` | no |
| <a name="input_app_repo_existing_git_id"></a> [app\_repo\_existing\_git\_id](#input\_app\_repo\_existing\_git\_id) | Custom server GUID, or other options for 'git\_id' field in the browser UI. | `string` | `""` | no |
| <a name="input_app_repo_existing_git_provider"></a> [app\_repo\_existing\_git\_provider](#input\_app\_repo\_existing\_git\_provider) | By default 'hostedgit', else use 'githubconsolidated' or 'gitlab'. | `string` | `""` | no |
| <a name="input_app_repo_existing_url"></a> [app\_repo\_existing\_url](#input\_app\_repo\_existing\_url) | Override to bring your own existing application repository URL, which will be used directly instead of cloning the default sample. | `string` | `""` | no |
| <a name="input_app_repo_git_token_secret_name"></a> [app\_repo\_git\_token\_secret\_name](#input\_app\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_app_repo_initilization_type"></a> [app\_repo\_initilization\_type](#input\_app\_repo\_initilization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_app_repo_integration_owner"></a> [app\_repo\_integration\_owner](#input\_app\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_app_repo_is_private_repo"></a> [app\_repo\_is\_private\_repo](#input\_app\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_app_repo_issues_enabled"></a> [app\_repo\_issues\_enabled](#input\_app\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_app_repo_name"></a> [app\_repo\_name](#input\_app\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_app_repo_template_url"></a> [app\_repo\_template\_url](#input\_app\_repo\_template\_url) | Url of app repo template to be cloned | `string` | `""` | no |
| <a name="input_app_repo_traceability_enabled"></a> [app\_repo\_traceability\_enabled](#input\_app\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_app_version"></a> [app\_version](#input\_app\_version) | The version of the app to deploy. | `string` | `"v1"` | no |
| <a name="input_artifactory_dashboard_url"></a> [artifactory\_dashboard\_url](#input\_artifactory\_dashboard\_url) | Type the URL that you want to navigate to when you click the Artifactory integration tile. | `string` | `""` | no |
| <a name="input_artifactory_integration_name"></a> [artifactory\_integration\_name](#input\_artifactory\_integration\_name) | The name of the Artifactory tool integration | `string` | `"artifactory-dockerconfigjson"` | no |
| <a name="input_artifactory_repo_name"></a> [artifactory\_repo\_name](#input\_artifactory\_repo\_name) | Type the name of your Artifactory repository where your docker images are located. | `string` | `"wcp-compliance-automation-team-docker-local"` | no |
| <a name="input_artifactory_repo_url"></a> [artifactory\_repo\_url](#input\_artifactory\_repo\_url) | Type the URL for your Artifactory release repository. | `string` | `""` | no |
| <a name="input_artifactory_token_secret_name"></a> [artifactory\_token\_secret\_name](#input\_artifactory\_token\_secret\_name) | Name of the artifactory token secret in the secret provider. | `string` | `"artifactory-token"` | no |
| <a name="input_artifactory_user"></a> [artifactory\_user](#input\_artifactory\_user) | Type the User ID or email for your Artifactory repository. | `string` | `""` | no |
| <a name="input_authorization_policy_creation"></a> [authorization\_policy\_creation](#input\_authorization\_policy\_creation) | Disable Toolchain Service to Secrets Manager Service authorization policy creation. | `string` | `""` | no |
| <a name="input_ci_pipeline_branch"></a> [ci\_pipeline\_branch](#input\_ci\_pipeline\_branch) | The branch within ci pipeline definitions repository for Compliance CI Toolchain. | `string` | `"open-v9"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the Kubernetes cluster where the application will be deployed. | `string` | `"mycluster-free"` | no |
| <a name="input_cluster_namespace"></a> [cluster\_namespace](#input\_cluster\_namespace) | Namespace of the Kubernetes cluster where the application will be deployed. | `string` | `"default"` | no |
| <a name="input_code_engine_build_strategy"></a> [code\_engine\_build\_strategy](#input\_code\_engine\_build\_strategy) | The build strategy for the Code Engine entity. Default strategy is 'dockerfile'. Set as 'buildpacks' for 'buildpacks' build. | `string` | `""` | no |
| <a name="input_code_engine_entity_type"></a> [code\_engine\_entity\_type](#input\_code\_engine\_entity\_type) | Type of Code Engine entity to create/update as part of deployment. Default type is 'application'. Set as 'job' for 'job' type. | `string` | `""` | no |
| <a name="input_code_engine_project"></a> [code\_engine\_project](#input\_code\_engine\_project) | The name of the Code Engine project to use (or create). | `string` | `"DevSecOps_CE"` | no |
| <a name="input_code_engine_region"></a> [code\_engine\_region](#input\_code\_engine\_region) | The region to create/lookup for the Code Engine project. | `string` | `"ibm:yp:us-south"` | no |
| <a name="input_code_engine_resource_group"></a> [code\_engine\_resource\_group](#input\_code\_engine\_resource\_group) | The resource group of the Code Engine project. | `string` | `"Default"` | no |
| <a name="input_code_engine_source"></a> [code\_engine\_source](#input\_code\_engine\_source) | The path to the location of code to build in the repository. | `string` | `""` | no |
| <a name="input_compliance_base_image"></a> [compliance\_base\_image](#input\_compliance\_base\_image) | Pipeline baseimage to run most of the built-in pipeline code. | `string` | `""` | no |
| <a name="input_compliance_pipeline_group"></a> [compliance\_pipeline\_group](#input\_compliance\_pipeline\_group) | Specify Git user/group for your compliance pipeline repo. | `string` | `""` | no |
| <a name="input_compliance_pipeline_repo_auth_type"></a> [compliance\_pipeline\_repo\_auth\_type](#input\_compliance\_pipeline\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_compliance_pipeline_repo_git_provider"></a> [compliance\_pipeline\_repo\_git\_provider](#input\_compliance\_pipeline\_repo\_git\_provider) | Git provider for pipeline repo | `string` | `"hostedgit"` | no |
| <a name="input_compliance_pipeline_repo_git_token_secret_name"></a> [compliance\_pipeline\_repo\_git\_token\_secret\_name](#input\_compliance\_pipeline\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_compliance_pipeline_repo_integration_owner"></a> [compliance\_pipeline\_repo\_integration\_owner](#input\_compliance\_pipeline\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_compliance_pipeline_repo_issues_enabled"></a> [compliance\_pipeline\_repo\_issues\_enabled](#input\_compliance\_pipeline\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_compliance_pipeline_repo_url"></a> [compliance\_pipeline\_repo\_url](#input\_compliance\_pipeline\_repo\_url) | Url of pipeline repo template to be cloned | `string` | `""` | no |
| <a name="input_compliance_pipelines_repo_git_id"></a> [compliance\_pipelines\_repo\_git\_id](#input\_compliance\_pipelines\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_cos_api_key_secret_name"></a> [cos\_api\_key\_secret\_name](#input\_cos\_api\_key\_secret\_name) | Name of the COS API key secret in the secret provider. | `string` | `"cos-api-key"` | no |
| <a name="input_cos_bucket_name"></a> [cos\_bucket\_name](#input\_cos\_bucket\_name) | COS bucket name | `string` | `""` | no |
| <a name="input_cos_endpoint"></a> [cos\_endpoint](#input\_cos\_endpoint) | COS endpoint name | `string` | `""` | no |
| <a name="input_cra_generate_cyclonedx_format"></a> [cra\_generate\_cyclonedx\_format](#input\_cra\_generate\_cyclonedx\_format) | If set to 1, CRA also generates the BOM in cyclonedx format. | `string` | `"1"` | no |
| <a name="input_custom_image_tag"></a> [custom\_image\_tag](#input\_custom\_image\_tag) | The custom tag for the image in a comma-separated list. | `string` | `""` | no |
| <a name="input_default_git_provider"></a> [default\_git\_provider](#input\_default\_git\_provider) | Choose the default git provider for app repo | `string` | `"hostedgit"` | no |
| <a name="input_deployment_target"></a> [deployment\_target](#input\_deployment\_target) | The deployment target, 'cluster' or 'code-engine'. | `string` | `"cluster"` | no |
| <a name="input_dev_region"></a> [dev\_region](#input\_dev\_region) | Region of the Kubernetes cluster where the application will be deployed. | `string` | `"ibm:yp:us-south"` | no |
| <a name="input_dev_resource_group"></a> [dev\_resource\_group](#input\_dev\_resource\_group) | The cluster resource group. | `string` | `"Default"` | no |
| <a name="input_doi_environment"></a> [doi\_environment](#input\_doi\_environment) | The DevOps Insights target environment. | `string` | `""` | no |
| <a name="input_doi_toolchain_id"></a> [doi\_toolchain\_id](#input\_doi\_toolchain\_id) | DevOps Insights Toolchain ID to link to. | `string` | `""` | no |
| <a name="input_doi_toolchain_id_pipeline_property"></a> [doi\_toolchain\_id\_pipeline\_property](#input\_doi\_toolchain\_id\_pipeline\_property) | The DevOps Insights instance toolchain ID. | `string` | `""` | no |
| <a name="input_enable_artifactory"></a> [enable\_artifactory](#input\_enable\_artifactory) | Set true to enable artifacory for devsecops. | `bool` | `false` | no |
| <a name="input_enable_devops_signing_var"></a> [enable\_devops\_signing\_var](#input\_enable\_devops\_signing\_var) | Set to `true` to show the `signing-key` pipeline variable | `string` | `true` | no |
| <a name="input_enable_key_protect"></a> [enable\_key\_protect](#input\_enable\_key\_protect) | Set to enable Key Protect Integration. | `bool` | `false` | no |
| <a name="input_enable_pipeline_dockerconfigjson"></a> [enable\_pipeline\_dockerconfigjson](#input\_enable\_pipeline\_dockerconfigjson) | Enable to add the pipeline-dockerconfigjson to the pipeline properties | `bool` | `false` | no |
| <a name="input_enable_privateworker"></a> [enable\_privateworker](#input\_enable\_privateworker) | Set true to enable private worker  for devsecops. | `bool` | `false` | no |
| <a name="input_enable_secrets_manager"></a> [enable\_secrets\_manager](#input\_enable\_secrets\_manager) | Set to enable Secrets Manager Integration. | `bool` | `true` | no |
| <a name="input_enable_slack"></a> [enable\_slack](#input\_enable\_slack) | Set to true to create the integration | `bool` | `false` | no |
| <a name="input_evidence_group"></a> [evidence\_group](#input\_evidence\_group) | Specify Git user/group for evidence repository. | `string` | `""` | no |
| <a name="input_evidence_repo_auth_type"></a> [evidence\_repo\_auth\_type](#input\_evidence\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_evidence_repo_clone_from_url"></a> [evidence\_repo\_clone\_from\_url](#input\_evidence\_repo\_clone\_from\_url) | The repo URL that the intgeration will clone from. | `string` | `""` | no |
| <a name="input_evidence_repo_existing_url"></a> [evidence\_repo\_existing\_url](#input\_evidence\_repo\_existing\_url) | The repo URL that integration will link with. | `string` | `""` | no |
| <a name="input_evidence_repo_git_id"></a> [evidence\_repo\_git\_id](#input\_evidence\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_evidence_repo_git_provider"></a> [evidence\_repo\_git\_provider](#input\_evidence\_repo\_git\_provider) | Git provider for evidence repo | `string` | `"hostedgit"` | no |
| <a name="input_evidence_repo_git_token_secret_name"></a> [evidence\_repo\_git\_token\_secret\_name](#input\_evidence\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_evidence_repo_initilization_type"></a> [evidence\_repo\_initilization\_type](#input\_evidence\_repo\_initilization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_evidence_repo_integration_owner"></a> [evidence\_repo\_integration\_owner](#input\_evidence\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_evidence_repo_is_private_repo"></a> [evidence\_repo\_is\_private\_repo](#input\_evidence\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_evidence_repo_issues_enabled"></a> [evidence\_repo\_issues\_enabled](#input\_evidence\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_evidence_repo_name"></a> [evidence\_repo\_name](#input\_evidence\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_evidence_repo_traceability_enabled"></a> [evidence\_repo\_traceability\_enabled](#input\_evidence\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_evidence_source_repo_url"></a> [evidence\_source\_repo\_url](#input\_evidence\_source\_repo\_url) | Url of evidence repo template to be cloned | `string` | `""` | no |
| <a name="input_ibmcloud_api"></a> [ibmcloud\_api](#input\_ibmcloud\_api) | IBM Cloud API Endpoint. | `string` | `"https://cloud.ibm.com"` | no |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | API key used to create the toolchains. | `string` | n/a | yes |
| <a name="input_inventory_group"></a> [inventory\_group](#input\_inventory\_group) | Specify Git user/group for inventory repository. | `string` | `""` | no |
| <a name="input_inventory_repo_auth_type"></a> [inventory\_repo\_auth\_type](#input\_inventory\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_inventory_repo_clone_from_url"></a> [inventory\_repo\_clone\_from\_url](#input\_inventory\_repo\_clone\_from\_url) | The repo URL that the intgeration will clone from. | `string` | `""` | no |
| <a name="input_inventory_repo_existing_url"></a> [inventory\_repo\_existing\_url](#input\_inventory\_repo\_existing\_url) | The repo URL that integration will link with. | `string` | `""` | no |
| <a name="input_inventory_repo_git_id"></a> [inventory\_repo\_git\_id](#input\_inventory\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_inventory_repo_git_provider"></a> [inventory\_repo\_git\_provider](#input\_inventory\_repo\_git\_provider) | Git provider for inventory repo | `string` | `"hostedgit"` | no |
| <a name="input_inventory_repo_git_token_secret_name"></a> [inventory\_repo\_git\_token\_secret\_name](#input\_inventory\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_inventory_repo_initilization_type"></a> [inventory\_repo\_initilization\_type](#input\_inventory\_repo\_initilization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_inventory_repo_integration_owner"></a> [inventory\_repo\_integration\_owner](#input\_inventory\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_inventory_repo_is_private_repo"></a> [inventory\_repo\_is\_private\_repo](#input\_inventory\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_inventory_repo_issues_enabled"></a> [inventory\_repo\_issues\_enabled](#input\_inventory\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_inventory_repo_name"></a> [inventory\_repo\_name](#input\_inventory\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_inventory_repo_traceability_enabled"></a> [inventory\_repo\_traceability\_enabled](#input\_inventory\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_inventory_source_repo_url"></a> [inventory\_source\_repo\_url](#input\_inventory\_source\_repo\_url) | Url of inventory repo template to be cloned | `string` | `""` | no |
| <a name="input_issues_group"></a> [issues\_group](#input\_issues\_group) | Specify Git user/group for issues repository. | `string` | `""` | no |
| <a name="input_issues_repo_auth_type"></a> [issues\_repo\_auth\_type](#input\_issues\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_issues_repo_clone_from_url"></a> [issues\_repo\_clone\_from\_url](#input\_issues\_repo\_clone\_from\_url) | The repo URL that the intgeration will clone from. | `string` | `""` | no |
| <a name="input_issues_repo_existing_url"></a> [issues\_repo\_existing\_url](#input\_issues\_repo\_existing\_url) | The repo URL that integration will link with. | `string` | `""` | no |
| <a name="input_issues_repo_git_id"></a> [issues\_repo\_git\_id](#input\_issues\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_issues_repo_git_provider"></a> [issues\_repo\_git\_provider](#input\_issues\_repo\_git\_provider) | Git provider for issue repo | `string` | `"hostedgit"` | no |
| <a name="input_issues_repo_git_token_secret_name"></a> [issues\_repo\_git\_token\_secret\_name](#input\_issues\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_issues_repo_initilization_type"></a> [issues\_repo\_initilization\_type](#input\_issues\_repo\_initilization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_issues_repo_integration_owner"></a> [issues\_repo\_integration\_owner](#input\_issues\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_issues_repo_is_private_repo"></a> [issues\_repo\_is\_private\_repo](#input\_issues\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_issues_repo_issues_enabled"></a> [issues\_repo\_issues\_enabled](#input\_issues\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `true` | no |
| <a name="input_issues_repo_name"></a> [issues\_repo\_name](#input\_issues\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_issues_repo_traceability_enabled"></a> [issues\_repo\_traceability\_enabled](#input\_issues\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_issues_source_repo_url"></a> [issues\_source\_repo\_url](#input\_issues\_source\_repo\_url) | Url of issue repo template to be cloned | `string` | `""` | no |
| <a name="input_kp_integration_name"></a> [kp\_integration\_name](#input\_kp\_integration\_name) | The name of the Key Protect integration. | `string` | `"kp-compliance-secrets"` | no |
| <a name="input_kp_location"></a> [kp\_location](#input\_kp\_location) | IBM Cloud location/region containing the Key Protect instance. | `string` | `"us-south"` | no |
| <a name="input_kp_name"></a> [kp\_name](#input\_kp\_name) | Name of the Key Protect instance where the secrets are stored. | `string` | `"kp-compliance-secrets"` | no |
| <a name="input_kp_resource_group"></a> [kp\_resource\_group](#input\_kp\_resource\_group) | The resource group containing the Key Protect instance. | `string` | `"Default"` | no |
| <a name="input_link_to_doi_toolchain"></a> [link\_to\_doi\_toolchain](#input\_link\_to\_doi\_toolchain) | Enable a link to a DevOps Insights instance in another toolchain, true or false. | `bool` | `false` | no |
| <a name="input_opt_in_dynamic_api_scan"></a> [opt\_in\_dynamic\_api\_scan](#input\_opt\_in\_dynamic\_api\_scan) | To enable the OWASP Zap API scan. '1' enable or '0' disable. | `string` | `"1"` | no |
| <a name="input_opt_in_dynamic_scan"></a> [opt\_in\_dynamic\_scan](#input\_opt\_in\_dynamic\_scan) | To enable the OWASP Zap scan. '1' enable or '0' disable. | `string` | `"1"` | no |
| <a name="input_opt_in_dynamic_ui_scan"></a> [opt\_in\_dynamic\_ui\_scan](#input\_opt\_in\_dynamic\_ui\_scan) | To enable the OWASP Zap UI scan. '1' enable or '0' disable. | `string` | `"1"` | no |
| <a name="input_opt_in_sonar"></a> [opt\_in\_sonar](#input\_opt\_in\_sonar) | Opt in for Sonarqube. | `string` | `"1"` | no |
| <a name="input_opt_out_v1_evidence"></a> [opt\_out\_v1\_evidence](#input\_opt\_out\_v1\_evidence) | Opt out of evidence v1. | `string` | `"1"` | no |
| <a name="input_pipeline_config_group"></a> [pipeline\_config\_group](#input\_pipeline\_config\_group) | Specify Git user/group for your config repo. | `string` | `""` | no |
| <a name="input_pipeline_config_initilization_type"></a> [pipeline\_config\_initilization\_type](#input\_pipeline\_config\_initilization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_pipeline_config_path"></a> [pipeline\_config\_path](#input\_pipeline\_config\_path) | The name and path of the pipeline-config.yaml file within the pipeline-config/app repo | `string` | `".pipeline-config.yaml"` | no |
| <a name="input_pipeline_config_repo_auth_type"></a> [pipeline\_config\_repo\_auth\_type](#input\_pipeline\_config\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_pipeline_config_repo_branch"></a> [pipeline\_config\_repo\_branch](#input\_pipeline\_config\_repo\_branch) | Specify the branch containing the custom pipeline-config.yaml file. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_clone_from_url"></a> [pipeline\_config\_repo\_clone\_from\_url](#input\_pipeline\_config\_repo\_clone\_from\_url) | Specify a repository containing a custom pipeline-config.yaml file | `string` | `""` | no |
| <a name="input_pipeline_config_repo_existing_url"></a> [pipeline\_config\_repo\_existing\_url](#input\_pipeline\_config\_repo\_existing\_url) | Specify a repository containing a custom pipeline-config.yaml file | `string` | `""` | no |
| <a name="input_pipeline_config_repo_git_id"></a> [pipeline\_config\_repo\_git\_id](#input\_pipeline\_config\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_git_provider"></a> [pipeline\_config\_repo\_git\_provider](#input\_pipeline\_config\_repo\_git\_provider) | Git provider for pipeline repo config | `string` | `"hostedgit"` | no |
| <a name="input_pipeline_config_repo_git_token_secret_name"></a> [pipeline\_config\_repo\_git\_token\_secret\_name](#input\_pipeline\_config\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_pipeline_config_repo_integration_owner"></a> [pipeline\_config\_repo\_integration\_owner](#input\_pipeline\_config\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_is_private_repo"></a> [pipeline\_config\_repo\_is\_private\_repo](#input\_pipeline\_config\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_pipeline_config_repo_issues_enabled"></a> [pipeline\_config\_repo\_issues\_enabled](#input\_pipeline\_config\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_pipeline_config_repo_name"></a> [pipeline\_config\_repo\_name](#input\_pipeline\_config\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_traceability_enabled"></a> [pipeline\_config\_repo\_traceability\_enabled](#input\_pipeline\_config\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_pipeline_debug"></a> [pipeline\_debug](#input\_pipeline\_debug) | Set to '1' to enable debug logging | `string` | `"0"` | no |
| <a name="input_pipeline_dockerconfigjson_secret_name"></a> [pipeline\_dockerconfigjson\_secret\_name](#input\_pipeline\_dockerconfigjson\_secret\_name) | Name of the dockerconfigjson secret in the secret provider. | `string` | `"pipeline-dockerconfigjson"` | no |
| <a name="input_pipeline_ibmcloud_api_key_secret_name"></a> [pipeline\_ibmcloud\_api\_key\_secret\_name](#input\_pipeline\_ibmcloud\_api\_key\_secret\_name) | Name of the Cloud API key secret in the secret provider. | `string` | `"ibmcloud-api-key"` | no |
| <a name="input_pr_pipeline_branch"></a> [pr\_pipeline\_branch](#input\_pr\_pipeline\_branch) | The branch within pr pipeline definitions repository for Compliance CI Toolchain. | `string` | `"open-v9"` | no |
| <a name="input_privateworker_credentials_secret_name"></a> [privateworker\_credentials\_secret\_name](#input\_privateworker\_credentials\_secret\_name) | Name of the privateworker secret in the secret provider. | `string` | `"private-worker-service-api"` | no |
| <a name="input_privateworker_name"></a> [privateworker\_name](#input\_privateworker\_name) | The name of the private worker integration. | `string` | `"private-worker-tool-01"` | no |
| <a name="input_registry_namespace"></a> [registry\_namespace](#input\_registry\_namespace) | A unique namespace within the IBM Cloud Container Registry region where the application image is stored. | `string` | `"devsecops-ci-registry"` | no |
| <a name="input_registry_region"></a> [registry\_region](#input\_registry\_region) | IBM Cloud Region where the IBM Cloud Container Registry namespace is created. | `string` | `"ibm:yp:us-south"` | no |
| <a name="input_repositories_prefix"></a> [repositories\_prefix](#input\_repositories\_prefix) | Prefix name for the cloned compliance repos. | `string` | `"compliance"` | no |
| <a name="input_signing_key_secret_name"></a> [signing\_key\_secret\_name](#input\_signing\_key\_secret\_name) | Name of the signing key secret in the secret provider. | `string` | `"signing_key"` | no |
| <a name="input_slack_channel_name"></a> [slack\_channel\_name](#input\_slack\_channel\_name) | The Slack channel that notifications are posted to. | `string` | `"my-channel"` | no |
| <a name="input_slack_integration_name"></a> [slack\_integration\_name](#input\_slack\_integration\_name) | The name of the Slack integration. | `string` | `"slack-compliance"` | no |
| <a name="input_slack_notifications"></a> [slack\_notifications](#input\_slack\_notifications) | The switch that turns the Slack integration on or off. | `string` | `"0"` | no |
| <a name="input_slack_pipeline_fail"></a> [slack\_pipeline\_fail](#input\_slack\_pipeline\_fail) | Generate pipeline failed notifications. | `bool` | `true` | no |
| <a name="input_slack_pipeline_start"></a> [slack\_pipeline\_start](#input\_slack\_pipeline\_start) | Generate pipeline start notifications. | `bool` | `true` | no |
| <a name="input_slack_pipeline_success"></a> [slack\_pipeline\_success](#input\_slack\_pipeline\_success) | Generate pipeline succeeded notifications. | `bool` | `true` | no |
| <a name="input_slack_team_name"></a> [slack\_team\_name](#input\_slack\_team\_name) | The Slack team name, which is the word or phrase before .slack.com in the team URL. | `string` | `"my-team"` | no |
| <a name="input_slack_toolchain_bind"></a> [slack\_toolchain\_bind](#input\_slack\_toolchain\_bind) | Generate tool added to toolchain notifications. | `bool` | `true` | no |
| <a name="input_slack_toolchain_unbind"></a> [slack\_toolchain\_unbind](#input\_slack\_toolchain\_unbind) | Generate tool removed from toolchain notifications. | `bool` | `true` | no |
| <a name="input_slack_webhook_secret_name"></a> [slack\_webhook\_secret\_name](#input\_slack\_webhook\_secret\_name) | Name of the webhook secret in the secret provider. | `string` | `"slack-webhook"` | no |
| <a name="input_sm_integration_name"></a> [sm\_integration\_name](#input\_sm\_integration\_name) | The name of the Secrets Manager integration. | `string` | `"sm-compliance-secrets"` | no |
| <a name="input_sm_location"></a> [sm\_location](#input\_sm\_location) | IBM Cloud location/region containing the Secrets Manager instance. | `string` | `"us-south"` | no |
| <a name="input_sm_name"></a> [sm\_name](#input\_sm\_name) | Name of the Secrets Manager instance where the secrets are stored. | `string` | `"sm-compliance-secrets"` | no |
| <a name="input_sm_resource_group"></a> [sm\_resource\_group](#input\_sm\_resource\_group) | The resource group containing the Secrets Manager instance. | `string` | `"Default"` | no |
| <a name="input_sm_secret_group"></a> [sm\_secret\_group](#input\_sm\_secret\_group) | Group in Secrets Manager for organizing/grouping secrets. | `string` | `"Default"` | no |
| <a name="input_sonarqube_config"></a> [sonarqube\_config](#input\_sonarqube\_config) | Runs a SonarQube scan in an isolated Docker-in-Docker container (default configuration) or in an existing Kubernetes cluster (custom configuration). Options: default or custom. | `string` | `"default"` | no |
| <a name="input_toolchain_description"></a> [toolchain\_description](#input\_toolchain\_description) | Description for the CI Toolchain. | `string` | `"Toolchain created with Terraform template for DevSecOps CI Best Practices."` | no |
| <a name="input_toolchain_name"></a> [toolchain\_name](#input\_toolchain\_name) | Name of the CI Toolchain. | `string` | `"DevSecOps CI Toolchain - Terraform"` | no |
| <a name="input_toolchain_region"></a> [toolchain\_region](#input\_toolchain\_region) | IBM Cloud Region for the toolchain. | `string` | `"us-south"` | no |
| <a name="input_toolchain_resource_group"></a> [toolchain\_resource\_group](#input\_toolchain\_resource\_group) | The resource group within which the toolchain is created. | `string` | `"Default"` | no |
| <a name="input_trigger_git_enable"></a> [trigger\_git\_enable](#input\_trigger\_git\_enable) | Set to `true` to enable the CI pipeline Git trigger. | `bool` | `true` | no |
| <a name="input_trigger_git_name"></a> [trigger\_git\_name](#input\_trigger\_git\_name) | The name of the CI pipeline GIT trigger. | `string` | `"Git CI Trigger"` | no |
| <a name="input_trigger_manual_enable"></a> [trigger\_manual\_enable](#input\_trigger\_manual\_enable) | Set to `true` to enable the CI pipeline Manual trigger. | `bool` | `true` | no |
| <a name="input_trigger_manual_name"></a> [trigger\_manual\_name](#input\_trigger\_manual\_name) | The name of the CI pipeline Manual trigger. | `string` | `"Manual Trigger"` | no |
| <a name="input_trigger_pr_git_enable"></a> [trigger\_pr\_git\_enable](#input\_trigger\_pr\_git\_enable) | Set to `true` to enable the PR pipeline Git trigger. | `bool` | `true` | no |
| <a name="input_trigger_pr_git_name"></a> [trigger\_pr\_git\_name](#input\_trigger\_pr\_git\_name) | The name of the PR pipeline GIT trigger. | `string` | `"Git PR Trigger"` | no |
| <a name="input_trigger_timed_cron_schedule"></a> [trigger\_timed\_cron\_schedule](#input\_trigger\_timed\_cron\_schedule) | Only needed for timer triggers. Cron expression that indicates when this trigger will activate. Maximum frequency is every 5 minutes. The string is based on UNIX crontab syntax: minute, hour, day of month, month, day of week. Example: 0 *\_/2 * * * - every 2 hours. | `string` | `"0 4 * * *"` | no |
| <a name="input_trigger_timed_enable"></a> [trigger\_timed\_enable](#input\_trigger\_timed\_enable) | Set to `true` to enable the CI pipeline Timed trigger. | `bool` | `false` | no |
| <a name="input_trigger_timed_name"></a> [trigger\_timed\_name](#input\_trigger\_timed\_name) | The name of the CI pipeline Timed trigger. | `string` | `"Git CI Timed Trigger"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_repo_branch"></a> [app\_repo\_branch](#output\_app\_repo\_branch) | The branch of the app repo to be used. |
| <a name="output_app_repo_git_id"></a> [app\_repo\_git\_id](#output\_app\_repo\_git\_id) | The app repo Git ID. |
| <a name="output_app_repo_git_provider"></a> [app\_repo\_git\_provider](#output\_app\_repo\_git\_provider) | The app repo provider 'hostedgit', 'githubconsolidated' etc. |
| <a name="output_app_repo_url"></a> [app\_repo\_url](#output\_app\_repo\_url) | The app repository instance URL containing an application that can be built and deployed with the reference DevSecOps toolchain templates. |
| <a name="output_ci_pipeline_id"></a> [ci\_pipeline\_id](#output\_ci\_pipeline\_id) | The CI pipeline ID. |
| <a name="output_evidence_repo"></a> [evidence\_repo](#output\_evidence\_repo) | The Evidence repo. |
| <a name="output_evidence_repo_url"></a> [evidence\_repo\_url](#output\_evidence\_repo\_url) | The evidence repository instance URL, where evidence of the builds and scans are stored, ready for any compliance audit. |
| <a name="output_inventory_repo"></a> [inventory\_repo](#output\_inventory\_repo) | The Inventory repo. |
| <a name="output_inventory_repo_url"></a> [inventory\_repo\_url](#output\_inventory\_repo\_url) | The inventory repository instance URL, with details of which artifact has been built and will be deployed. |
| <a name="output_issues_repo"></a> [issues\_repo](#output\_issues\_repo) | The Issues repo. |
| <a name="output_issues_repo_url"></a> [issues\_repo\_url](#output\_issues\_repo\_url) | The incident issues repository instance URL, where issues are created when vulnerabilities and CVEs are detected. |
| <a name="output_key_protect_instance_id"></a> [key\_protect\_instance\_id](#output\_key\_protect\_instance\_id) | The Key Protect instance ID. |
| <a name="output_pipeline_repo_url"></a> [pipeline\_repo\_url](#output\_pipeline\_repo\_url) | This repository URL contains the tekton definitions for compliance pipelines. |
| <a name="output_pr_pipeline_id"></a> [pr\_pipeline\_id](#output\_pr\_pipeline\_id) | The PR pipeline ID. |
| <a name="output_secret_tool"></a> [secret\_tool](#output\_secret\_tool) | The secret tool. |
| <a name="output_secrets_manager_instance_id"></a> [secrets\_manager\_instance\_id](#output\_secrets\_manager\_instance\_id) | The Secrets Manager instance ID. |
| <a name="output_toolchain_id"></a> [toolchain\_id](#output\_toolchain\_id) | The CI toolchain ID. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- BEGIN CONTRIBUTING HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set up steps for contributors to follow -->
## Contributing
<!-- Source for this readme file: https://github.com/terraform-ibm-modules/common-dev-assets/tree/main/module-assets/ci/module-template-automation -->
<!-- END CONTRIBUTING HOOK -->
