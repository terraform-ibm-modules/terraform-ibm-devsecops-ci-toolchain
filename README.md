<!-- BEGIN MODULE HOOK -->

<!-- Update the title to match the module name and add a description -->
## Terraform DevSecOps CI Toolchain
<!-- UPDATE BADGE: Update the link for the following badge-->

A Terraform module for provisioning the DevSecOps CI toolchain.

<!-- Remove the content in this H2 heading after completing the steps -->
<!-- Remove the content in this previous H2 heading -->
## Usage

```hcl
module "terraform_devsecops_ci" {
  source                   = "git::https://github.com/terraform-ibm-modules/terraform-ibm-devsecops-ci-toolchain?ref=v1.3.0"
  toolchain_region         = var.toolchain_region
  toolchain_resource_group = var.toolchain_resource_group
  registry_namespace       = var.registry_namespace
  sm_resource_group        = var.sm_resource_group
  sm_name                  = var.sm_name
  sm_location              = var.sm_location
  sm_secret_group          = var.sm_secret_group
  dev_region               = var.dev_region
}
```
<!-- END EXAMPLES HOOK -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >=1.65.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_repo"></a> [app\_repo](#module\_app\_repo) | ./customizations/repositories | n/a |
| <a name="module_compliance_pipelines_repo"></a> [compliance\_pipelines\_repo](#module\_compliance\_pipelines\_repo) | ./customizations/repositories | n/a |
| <a name="module_evidence_repo"></a> [evidence\_repo](#module\_evidence\_repo) | ./customizations/repositories | n/a |
| <a name="module_integrations"></a> [integrations](#module\_integrations) | ./integrations | n/a |
| <a name="module_inventory_repo"></a> [inventory\_repo](#module\_inventory\_repo) | ./customizations/repositories | n/a |
| <a name="module_issues_repo"></a> [issues\_repo](#module\_issues\_repo) | ./customizations/repositories | n/a |
| <a name="module_pipeline_ci"></a> [pipeline\_ci](#module\_pipeline\_ci) | ./pipeline-ci | n/a |
| <a name="module_pipeline_config_repo"></a> [pipeline\_config\_repo](#module\_pipeline\_config\_repo) | ./customizations/repositories | n/a |
| <a name="module_pipeline_pr"></a> [pipeline\_pr](#module\_pipeline\_pr) | ./pipeline-pr | n/a |
| <a name="module_pipeline_properties"></a> [pipeline\_properties](#module\_pipeline\_properties) | ./customizations/pipeline-property-adder | n/a |
| <a name="module_repository_properties"></a> [repository\_properties](#module\_repository\_properties) | ./customizations/repository-adder | n/a |
| <a name="module_services"></a> [services](#module\_services) | ./services | n/a |

### Resources

| Name | Type |
|------|------|
| [ibm_cd_toolchain.toolchain_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/cd_toolchain) | resource |
| [ibm_cd_toolchain_tool_pipeline.ci_pipeline](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/cd_toolchain_tool_pipeline) | resource |
| [ibm_cd_toolchain_tool_pipeline.pr_pipeline](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/cd_toolchain_tool_pipeline) | resource |
| [ibm_resource_group.resource_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/resource_group) | data source |

### Inputs

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
| <a name="input_app_repo_git_token_secret_crn"></a> [app\_repo\_git\_token\_secret\_crn](#input\_app\_repo\_git\_token\_secret\_crn) | The CRN for the app repository Git Token. | `string` | `""` | no |
| <a name="input_app_repo_git_token_secret_name"></a> [app\_repo\_git\_token\_secret\_name](#input\_app\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_app_repo_initialization_type"></a> [app\_repo\_initialization\_type](#input\_app\_repo\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_app_repo_integration_owner"></a> [app\_repo\_integration\_owner](#input\_app\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_app_repo_is_private_repo"></a> [app\_repo\_is\_private\_repo](#input\_app\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_app_repo_issues_enabled"></a> [app\_repo\_issues\_enabled](#input\_app\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_app_repo_name"></a> [app\_repo\_name](#input\_app\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_app_repo_secret_group"></a> [app\_repo\_secret\_group](#input\_app\_repo\_secret\_group) | Secret group prefix for the App repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_app_repo_template_url"></a> [app\_repo\_template\_url](#input\_app\_repo\_template\_url) | Url of app repo template to be cloned | `string` | `""` | no |
| <a name="input_app_repo_traceability_enabled"></a> [app\_repo\_traceability\_enabled](#input\_app\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_app_version"></a> [app\_version](#input\_app\_version) | The version of the app to deploy. | `string` | `"v1"` | no |
| <a name="input_artifactory_dashboard_url"></a> [artifactory\_dashboard\_url](#input\_artifactory\_dashboard\_url) | Type the URL that you want to navigate to when you click the Artifactory integration tile. | `string` | `""` | no |
| <a name="input_artifactory_integration_name"></a> [artifactory\_integration\_name](#input\_artifactory\_integration\_name) | The name of the Artifactory tool integration | `string` | `"artifactory-dockerconfigjson"` | no |
| <a name="input_artifactory_repo_name"></a> [artifactory\_repo\_name](#input\_artifactory\_repo\_name) | Type the name of your Artifactory repository where your docker images are located. | `string` | `"wcp-compliance-automation-team-docker-local"` | no |
| <a name="input_artifactory_repo_url"></a> [artifactory\_repo\_url](#input\_artifactory\_repo\_url) | Type the URL for your Artifactory release repository. | `string` | `""` | no |
| <a name="input_artifactory_token_secret_crn"></a> [artifactory\_token\_secret\_crn](#input\_artifactory\_token\_secret\_crn) | The CRN for the Artifactory secret. | `string` | `""` | no |
| <a name="input_artifactory_token_secret_group"></a> [artifactory\_token\_secret\_group](#input\_artifactory\_token\_secret\_group) | Secret group prefix for the Artifactory token secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_artifactory_token_secret_name"></a> [artifactory\_token\_secret\_name](#input\_artifactory\_token\_secret\_name) | Name of the artifactory token secret in the secret provider. | `string` | `"artifactory-token"` | no |
| <a name="input_artifactory_user"></a> [artifactory\_user](#input\_artifactory\_user) | Type the User ID or email for your Artifactory repository. | `string` | `""` | no |
| <a name="input_authorization_policy_creation"></a> [authorization\_policy\_creation](#input\_authorization\_policy\_creation) | Disable Toolchain Service to Secrets Manager Service authorization policy creation. | `string` | `""` | no |
| <a name="input_ci_cra_bom_generate"></a> [ci\_cra\_bom\_generate](#input\_ci\_cra\_bom\_generate) | Set this flag to `1` to generate cra bom in CI pipeline. | `string` | `"1"` | no |
| <a name="input_ci_cra_deploy_analysis"></a> [ci\_cra\_deploy\_analysis](#input\_ci\_cra\_deploy\_analysis) | Set this flag to `1` for cra deployment analysis to be done in CI pipeline. | `string` | `"1"` | no |
| <a name="input_ci_cra_vulnerability_scan"></a> [ci\_cra\_vulnerability\_scan](#input\_ci\_cra\_vulnerability\_scan) | Set this flag to `1` and `ci-cra-bom-generate` to `1` for cra vulnerability scan in CI pipeline. If this value is set to 1 and `ci-cra-bom-generate` is set to `0`, the scan will be marked as `failure` | `string` | `"1"` | no |
| <a name="input_ci_pipeline_branch"></a> [ci\_pipeline\_branch](#input\_ci\_pipeline\_branch) | The branch within CI pipeline definitions repository for Compliance CI Toolchain. | `string` | `"open-v10"` | no |
| <a name="input_ci_pipeline_git_tag"></a> [ci\_pipeline\_git\_tag](#input\_ci\_pipeline\_git\_tag) | The GIT tag within the CI pipeline definitions repository for Compliance CI Toolchain. | `string` | `""` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the Kubernetes cluster where the application will be deployed. | `string` | `"mycluster-free"` | no |
| <a name="input_code_engine_app_concurrency"></a> [code\_engine\_app\_concurrency](#input\_code\_engine\_app\_concurrency) | The maximum number of requests that can be processed concurrently per instance. | `string` | `"100"` | no |
| <a name="input_code_engine_app_deployment_timeout"></a> [code\_engine\_app\_deployment\_timeout](#input\_code\_engine\_app\_deployment\_timeout) | The maximum timeout for the application deployment. | `string` | `"300"` | no |
| <a name="input_code_engine_app_max_scale"></a> [code\_engine\_app\_max\_scale](#input\_code\_engine\_app\_max\_scale) | The maximum number of instances that can be used for this application. If you set this value to 0, the application scales as needed. The application scaling is limited only by the instances per the resource quota for the project of your application. | `string` | `"1"` | no |
| <a name="input_code_engine_app_min_scale"></a> [code\_engine\_app\_min\_scale](#input\_code\_engine\_app\_min\_scale) | The minimum number of instances that can be used for this application. This option is useful to ensure that no instances are running when not needed. | `string` | `"0"` | no |
| <a name="input_code_engine_app_port"></a> [code\_engine\_app\_port](#input\_code\_engine\_app\_port) | The port where the application listens. The format is `[NAME:]PORT`, where `[NAME:]` is optional. If `[NAME:]` is specified, valid values are `h2c`, or `http1`. When `[NAME:]` is not specified or is `http1`, the port uses `HTTP/1.1`. When `[NAME:]` is `h2c`, the port uses unencrypted `HTTP/2`. | `string` | `"8080"` | no |
| <a name="input_code_engine_app_visibility"></a> [code\_engine\_app\_visibility](#input\_code\_engine\_app\_visibility) | The visibility for the application. Valid values are public, private and project. Setting a visibility of public means that your app can receive requests from the public internet or from components within the Code Engine project. Setting a visibility of private means that your app is not accessible from the public internet and network access is only possible from other IBM Cloud using Virtual Private Endpoints (VPE) or Code Engine components that are running in the same project. Visibility can only be private if the project supports application private visibility. Setting a visibility of project means that your app is not accessible from the public internet and network access is only possible from other Code Engine components that are running in the same project. | `string` | `"public"` | no |
| <a name="input_code_engine_binding_resource_group"></a> [code\_engine\_binding\_resource\_group](#input\_code\_engine\_binding\_resource\_group) | The name of a resource group to use for authentication for the service bindings of the Code Engine project. A service ID is created with Operator and Manager roles for all services in this resource group. Use '*' to specify all resource groups in this account. | `string` | `""` | no |
| <a name="input_code_engine_build_size"></a> [code\_engine\_build\_size](#input\_code\_engine\_build\_size) | The size to use for the build, which determines the amount of resources used. Valid values include `small`, `medium`, `large`, `xlarge`. | `string` | `"large"` | no |
| <a name="input_code_engine_build_strategy"></a> [code\_engine\_build\_strategy](#input\_code\_engine\_build\_strategy) | The build strategy for the Code Engine component. It can be `dockerfile` or `buildpacks`. | `string` | `"dockerfile"` | no |
| <a name="input_code_engine_build_timeout"></a> [code\_engine\_build\_timeout](#input\_code\_engine\_build\_timeout) | The amount of time, in seconds, that can pass before the build run must succeed or fail. | `string` | `"1200"` | no |
| <a name="input_code_engine_build_use_native_docker"></a> [code\_engine\_build\_use\_native\_docker](#input\_code\_engine\_build\_use\_native\_docker) | Property to opt-in for using native docker build capabilities as opposed to use Code Engine build to containerize the source. Note this setting only takes effect if the build-strategy is set to `dockerfile`. Valid values are `true` and `false`. | `string` | `"false"` | no |
| <a name="input_code_engine_context_dir"></a> [code\_engine\_context\_dir](#input\_code\_engine\_context\_dir) | The directory in the repository that contains the buildpacks file or the Dockerfile. | `string` | `"."` | no |
| <a name="input_code_engine_cpu"></a> [code\_engine\_cpu](#input\_code\_engine\_cpu) | The amount of CPU set for the instance of the application or job. | `string` | `"0.25"` | no |
| <a name="input_code_engine_deployment_type"></a> [code\_engine\_deployment\_type](#input\_code\_engine\_deployment\_type) | type of Code Engine component to create/update as part of deployment. It can be either `application` or `job`. | `string` | `"application"` | no |
| <a name="input_code_engine_dockerfile"></a> [code\_engine\_dockerfile](#input\_code\_engine\_dockerfile) | The path to the `Dockerfile`. Specify this option only if the name is other than `Dockerfile` | `string` | `"Dockerfile"` | no |
| <a name="input_code_engine_env_from_configmaps"></a> [code\_engine\_env\_from\_configmaps](#input\_code\_engine\_env\_from\_configmaps) | Semi-colon separated list of configmaps to set environment variables. | `string` | `""` | no |
| <a name="input_code_engine_env_from_secrets"></a> [code\_engine\_env\_from\_secrets](#input\_code\_engine\_env\_from\_secrets) | Semi-colon separated list of secrets to set environment variables. | `string` | `""` | no |
| <a name="input_code_engine_ephemeral_storage"></a> [code\_engine\_ephemeral\_storage](#input\_code\_engine\_ephemeral\_storage) | The amount of ephemeral storage to set for the instance of the application or for the runs of the job. Use M for megabytes or G for gigabytes. | `string` | `"0.4G"` | no |
| <a name="input_code_engine_image_name"></a> [code\_engine\_image\_name](#input\_code\_engine\_image\_name) | Name of the image that is built. | `string` | `""` | no |
| <a name="input_code_engine_job_instances"></a> [code\_engine\_job\_instances](#input\_code\_engine\_job\_instances) | Specifies the number of instances that are used for runs of the job. When you use this option, the system converts to array indices. For example, if you specify instances of 5, the system converts to array-indices of 0 - 4. This option can only be specified if the --array-indices option is not specified. The default value is 1. | `string` | `"1"` | no |
| <a name="input_code_engine_job_maxexecutiontime"></a> [code\_engine\_job\_maxexecutiontime](#input\_code\_engine\_job\_maxexecutiontime) | The maximum execution time in seconds for runs of the job. | `string` | `"7200"` | no |
| <a name="input_code_engine_job_retrylimit"></a> [code\_engine\_job\_retrylimit](#input\_code\_engine\_job\_retrylimit) | The number of times to rerun an instance of the job before the job is marked as failed. | `string` | `"3"` | no |
| <a name="input_code_engine_memory"></a> [code\_engine\_memory](#input\_code\_engine\_memory) | The amount of memory set for the instance of the application or job. Use M for megabytes or G for gigabytes. | `string` | `"0.5G"` | no |
| <a name="input_code_engine_project"></a> [code\_engine\_project](#input\_code\_engine\_project) | The name of the Code Engine project to use. Created if it does not exist. | `string` | `"DevSecOps_CE"` | no |
| <a name="input_code_engine_region"></a> [code\_engine\_region](#input\_code\_engine\_region) | The region to create/lookup for the Code Engine project. | `string` | `"us-south"` | no |
| <a name="input_code_engine_registry_domain"></a> [code\_engine\_registry\_domain](#input\_code\_engine\_registry\_domain) | The container registry URL domain that is used to build and tag the image. Useful when using private-endpoint container registry. | `string` | `""` | no |
| <a name="input_code_engine_remove_refs"></a> [code\_engine\_remove\_refs](#input\_code\_engine\_remove\_refs) | Remove references to unspecified configuration resources (configmap/secret) references (pulled from env-from-configmaps, env-from-secrets along with auto-managed by CD). | `string` | `"false"` | no |
| <a name="input_code_engine_resource_group"></a> [code\_engine\_resource\_group](#input\_code\_engine\_resource\_group) | The resource group of the Code Engine project. | `string` | `"Default"` | no |
| <a name="input_code_engine_service_bindings"></a> [code\_engine\_service\_bindings](#input\_code\_engine\_service\_bindings) | JSON array including service name(s) (as a simple JSON string. | `string` | `""` | no |
| <a name="input_code_engine_source"></a> [code\_engine\_source](#input\_code\_engine\_source) | The path to the location of code to build in the repository. Defaults to the root of source code repository. | `string` | `""` | no |
| <a name="input_code_engine_wait_timeout"></a> [code\_engine\_wait\_timeout](#input\_code\_engine\_wait\_timeout) | The maximum timeout for the CLI operation to wait. | `string` | `"1300"` | no |
| <a name="input_compliance_base_image"></a> [compliance\_base\_image](#input\_compliance\_base\_image) | Pipeline baseimage to run most of the built-in pipeline code. | `string` | `""` | no |
| <a name="input_compliance_pipeline_group"></a> [compliance\_pipeline\_group](#input\_compliance\_pipeline\_group) | Specify Git user/group for your compliance pipeline repo. | `string` | `""` | no |
| <a name="input_compliance_pipeline_repo_auth_type"></a> [compliance\_pipeline\_repo\_auth\_type](#input\_compliance\_pipeline\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_compliance_pipeline_repo_git_provider"></a> [compliance\_pipeline\_repo\_git\_provider](#input\_compliance\_pipeline\_repo\_git\_provider) | Git provider for pipeline repo | `string` | `"hostedgit"` | no |
| <a name="input_compliance_pipeline_repo_git_token_secret_crn"></a> [compliance\_pipeline\_repo\_git\_token\_secret\_crn](#input\_compliance\_pipeline\_repo\_git\_token\_secret\_crn) | The CRN for the Compliance Pipeline repository Git Token. | `string` | `""` | no |
| <a name="input_compliance_pipeline_repo_git_token_secret_name"></a> [compliance\_pipeline\_repo\_git\_token\_secret\_name](#input\_compliance\_pipeline\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_compliance_pipeline_repo_integration_owner"></a> [compliance\_pipeline\_repo\_integration\_owner](#input\_compliance\_pipeline\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_compliance_pipeline_repo_issues_enabled"></a> [compliance\_pipeline\_repo\_issues\_enabled](#input\_compliance\_pipeline\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_compliance_pipeline_repo_secret_group"></a> [compliance\_pipeline\_repo\_secret\_group](#input\_compliance\_pipeline\_repo\_secret\_group) | Secret group prefix for the Compliance Pipeline repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_compliance_pipeline_repo_url"></a> [compliance\_pipeline\_repo\_url](#input\_compliance\_pipeline\_repo\_url) | Url of pipeline repo template to be cloned | `string` | `""` | no |
| <a name="input_compliance_pipelines_repo_git_id"></a> [compliance\_pipelines\_repo\_git\_id](#input\_compliance\_pipelines\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_cos_api_key_secret_crn"></a> [cos\_api\_key\_secret\_crn](#input\_cos\_api\_key\_secret\_crn) | The CRN for the Cloud Object Storage apikey. | `string` | `""` | no |
| <a name="input_cos_api_key_secret_group"></a> [cos\_api\_key\_secret\_group](#input\_cos\_api\_key\_secret\_group) | Secret group prefix for the COS API key secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_cos_api_key_secret_name"></a> [cos\_api\_key\_secret\_name](#input\_cos\_api\_key\_secret\_name) | Name of the COS API key secret in the secret provider. | `string` | `"cos-api-key"` | no |
| <a name="input_cos_bucket_name"></a> [cos\_bucket\_name](#input\_cos\_bucket\_name) | COS bucket name | `string` | `""` | no |
| <a name="input_cos_dashboard_url"></a> [cos\_dashboard\_url](#input\_cos\_dashboard\_url) | The dashboard URL for the COS toolcard. | `string` | `"https://cloud.ibm.com/objectstorage"` | no |
| <a name="input_cos_description"></a> [cos\_description](#input\_cos\_description) | The COS description on the tool card. | `string` | `"Cloud Object Storage to store evidences within DevSecOps Pipelines"` | no |
| <a name="input_cos_documentation_url"></a> [cos\_documentation\_url](#input\_cos\_documentation\_url) | The documentation URL that appears on the tool card. | `string` | `"https://cloud.ibm.com/objectstorage"` | no |
| <a name="input_cos_endpoint"></a> [cos\_endpoint](#input\_cos\_endpoint) | COS endpoint name | `string` | `""` | no |
| <a name="input_cos_integration_name"></a> [cos\_integration\_name](#input\_cos\_integration\_name) | The name of the COS integration. | `string` | `"Evidence Store"` | no |
| <a name="input_default_git_provider"></a> [default\_git\_provider](#input\_default\_git\_provider) | Choose the default git provider for app repo | `string` | `"hostedgit"` | no |
| <a name="input_deployment_target"></a> [deployment\_target](#input\_deployment\_target) | The deployment target, 'cluster' or 'code-engine'. | `string` | `"cluster"` | no |
| <a name="input_dev_region"></a> [dev\_region](#input\_dev\_region) | Region of the Kubernetes cluster where the application will be deployed. | `string` | `"ibm:yp:us-south"` | no |
| <a name="input_doi_toolchain_id"></a> [doi\_toolchain\_id](#input\_doi\_toolchain\_id) | DevOps Insights Toolchain ID to link to. | `string` | `""` | no |
| <a name="input_doi_toolchain_id_pipeline_property"></a> [doi\_toolchain\_id\_pipeline\_property](#input\_doi\_toolchain\_id\_pipeline\_property) | The DevOps Insights instance toolchain ID. | `string` | `""` | no |
| <a name="input_enable_artifactory"></a> [enable\_artifactory](#input\_enable\_artifactory) | Set true to enable artifacory for devsecops. | `bool` | `false` | no |
| <a name="input_enable_cos"></a> [enable\_cos](#input\_enable\_cos) | Set to `true` to enable the COS integration. | `bool` | `true` | no |
| <a name="input_enable_devops_signing_var"></a> [enable\_devops\_signing\_var](#input\_enable\_devops\_signing\_var) | Set to `true` to show the `signing-key` pipeline variable | `string` | `true` | no |
| <a name="input_enable_insights"></a> [enable\_insights](#input\_enable\_insights) | Set to `true` to enable the DevOps Insights integration. | `bool` | `true` | no |
| <a name="input_enable_key_protect"></a> [enable\_key\_protect](#input\_enable\_key\_protect) | Set to enable Key Protect Integration. | `bool` | `false` | no |
| <a name="input_enable_pipeline_dockerconfigjson"></a> [enable\_pipeline\_dockerconfigjson](#input\_enable\_pipeline\_dockerconfigjson) | Enable to add the pipeline-dockerconfigjson to the pipeline properties. | `bool` | `false` | no |
| <a name="input_enable_pipeline_git_token"></a> [enable\_pipeline\_git\_token](#input\_enable\_pipeline\_git\_token) | Enable to add `git-token` to the pipeline properties. | `bool` | `false` | no |
| <a name="input_enable_pipeline_notifications"></a> [enable\_pipeline\_notifications](#input\_enable\_pipeline\_notifications) | When enabled, pipeline run events will be sent to the Event Notifications and Slack integrations in the enclosing toolchain. | `bool` | `false` | no |
| <a name="input_enable_privateworker"></a> [enable\_privateworker](#input\_enable\_privateworker) | Set true to enable private worker  for devsecops. | `bool` | `false` | no |
| <a name="input_enable_secrets_manager"></a> [enable\_secrets\_manager](#input\_enable\_secrets\_manager) | Set to enable Secrets Manager Integration. | `bool` | `true` | no |
| <a name="input_enable_slack"></a> [enable\_slack](#input\_enable\_slack) | Set to true to create the integration | `bool` | `false` | no |
| <a name="input_event_notifications"></a> [event\_notifications](#input\_event\_notifications) | To enable event notification, set event\_notifications to 1 | `string` | `"0"` | no |
| <a name="input_event_notifications_crn"></a> [event\_notifications\_crn](#input\_event\_notifications\_crn) | The CRN for the Event Notifications instance. | `string` | `""` | no |
| <a name="input_event_notifications_tool_name"></a> [event\_notifications\_tool\_name](#input\_event\_notifications\_tool\_name) | The name of the Event Notifications integration. | `string` | `"Event Notifications"` | no |
| <a name="input_evidence_group"></a> [evidence\_group](#input\_evidence\_group) | Specify Git user/group for evidence repository. | `string` | `""` | no |
| <a name="input_evidence_repo_auth_type"></a> [evidence\_repo\_auth\_type](#input\_evidence\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_evidence_repo_clone_from_url"></a> [evidence\_repo\_clone\_from\_url](#input\_evidence\_repo\_clone\_from\_url) | The repo URL that the intgeration will clone from. | `string` | `""` | no |
| <a name="input_evidence_repo_existing_url"></a> [evidence\_repo\_existing\_url](#input\_evidence\_repo\_existing\_url) | The repo URL that integration will link with. | `string` | `""` | no |
| <a name="input_evidence_repo_git_id"></a> [evidence\_repo\_git\_id](#input\_evidence\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_evidence_repo_git_provider"></a> [evidence\_repo\_git\_provider](#input\_evidence\_repo\_git\_provider) | Git provider for evidence repo | `string` | `"hostedgit"` | no |
| <a name="input_evidence_repo_git_token_secret_crn"></a> [evidence\_repo\_git\_token\_secret\_crn](#input\_evidence\_repo\_git\_token\_secret\_crn) | The CRN for the Evidence repository Git Token. | `string` | `""` | no |
| <a name="input_evidence_repo_git_token_secret_name"></a> [evidence\_repo\_git\_token\_secret\_name](#input\_evidence\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_evidence_repo_initialization_type"></a> [evidence\_repo\_initialization\_type](#input\_evidence\_repo\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_evidence_repo_integration_owner"></a> [evidence\_repo\_integration\_owner](#input\_evidence\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_evidence_repo_is_private_repo"></a> [evidence\_repo\_is\_private\_repo](#input\_evidence\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_evidence_repo_issues_enabled"></a> [evidence\_repo\_issues\_enabled](#input\_evidence\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_evidence_repo_name"></a> [evidence\_repo\_name](#input\_evidence\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_evidence_repo_secret_group"></a> [evidence\_repo\_secret\_group](#input\_evidence\_repo\_secret\_group) | Secret group prefix for the Evidence repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_evidence_repo_traceability_enabled"></a> [evidence\_repo\_traceability\_enabled](#input\_evidence\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_evidence_source_repo_url"></a> [evidence\_source\_repo\_url](#input\_evidence\_source\_repo\_url) | Url of evidence repo template to be cloned | `string` | `""` | no |
| <a name="input_gosec_private_repository_host"></a> [gosec\_private\_repository\_host](#input\_gosec\_private\_repository\_host) | Your private repository base URL. | `string` | `""` | no |
| <a name="input_gosec_private_repository_ssh_key_secret_crn"></a> [gosec\_private\_repository\_ssh\_key\_secret\_crn](#input\_gosec\_private\_repository\_ssh\_key\_secret\_crn) | The CRN for the GoSec repository secret. | `string` | `""` | no |
| <a name="input_gosec_private_repository_ssh_key_secret_group"></a> [gosec\_private\_repository\_ssh\_key\_secret\_group](#input\_gosec\_private\_repository\_ssh\_key\_secret\_group) | Secret group prefix for the gosec private repository ssh key secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_gosec_private_repository_ssh_key_secret_name"></a> [gosec\_private\_repository\_ssh\_key\_secret\_name](#input\_gosec\_private\_repository\_ssh\_key\_secret\_name) | Name of the SSH key token for the private repository in the secret provider. | `string` | `"git-ssh-key"` | no |
| <a name="input_ibmcloud_api"></a> [ibmcloud\_api](#input\_ibmcloud\_api) | IBM Cloud API Endpoint. | `string` | `"https://cloud.ibm.com"` | no |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | API key used to create the toolchains. | `string` | n/a | yes |
| <a name="input_inventory_group"></a> [inventory\_group](#input\_inventory\_group) | Specify Git user/group for inventory repository. | `string` | `""` | no |
| <a name="input_inventory_repo_auth_type"></a> [inventory\_repo\_auth\_type](#input\_inventory\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_inventory_repo_clone_from_url"></a> [inventory\_repo\_clone\_from\_url](#input\_inventory\_repo\_clone\_from\_url) | The repo URL that the intgeration will clone from. | `string` | `""` | no |
| <a name="input_inventory_repo_existing_url"></a> [inventory\_repo\_existing\_url](#input\_inventory\_repo\_existing\_url) | The repo URL that integration will link with. | `string` | `""` | no |
| <a name="input_inventory_repo_git_id"></a> [inventory\_repo\_git\_id](#input\_inventory\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_inventory_repo_git_provider"></a> [inventory\_repo\_git\_provider](#input\_inventory\_repo\_git\_provider) | Git provider for inventory repo | `string` | `"hostedgit"` | no |
| <a name="input_inventory_repo_git_token_secret_crn"></a> [inventory\_repo\_git\_token\_secret\_crn](#input\_inventory\_repo\_git\_token\_secret\_crn) | The CRN for the Inventory repository Git Token. | `string` | `""` | no |
| <a name="input_inventory_repo_git_token_secret_name"></a> [inventory\_repo\_git\_token\_secret\_name](#input\_inventory\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_inventory_repo_initialization_type"></a> [inventory\_repo\_initialization\_type](#input\_inventory\_repo\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_inventory_repo_integration_owner"></a> [inventory\_repo\_integration\_owner](#input\_inventory\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_inventory_repo_is_private_repo"></a> [inventory\_repo\_is\_private\_repo](#input\_inventory\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_inventory_repo_issues_enabled"></a> [inventory\_repo\_issues\_enabled](#input\_inventory\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_inventory_repo_name"></a> [inventory\_repo\_name](#input\_inventory\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_inventory_repo_secret_group"></a> [inventory\_repo\_secret\_group](#input\_inventory\_repo\_secret\_group) | Secret group prefix for the Inventory repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_inventory_repo_traceability_enabled"></a> [inventory\_repo\_traceability\_enabled](#input\_inventory\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_inventory_source_repo_url"></a> [inventory\_source\_repo\_url](#input\_inventory\_source\_repo\_url) | Url of inventory repo template to be cloned | `string` | `""` | no |
| <a name="input_issues_group"></a> [issues\_group](#input\_issues\_group) | Specify Git user/group for issues repository. | `string` | `""` | no |
| <a name="input_issues_repo_auth_type"></a> [issues\_repo\_auth\_type](#input\_issues\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_issues_repo_clone_from_url"></a> [issues\_repo\_clone\_from\_url](#input\_issues\_repo\_clone\_from\_url) | The repo URL that the intgeration will clone from. | `string` | `""` | no |
| <a name="input_issues_repo_existing_url"></a> [issues\_repo\_existing\_url](#input\_issues\_repo\_existing\_url) | The repo URL that integration will link with. | `string` | `""` | no |
| <a name="input_issues_repo_git_id"></a> [issues\_repo\_git\_id](#input\_issues\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_issues_repo_git_provider"></a> [issues\_repo\_git\_provider](#input\_issues\_repo\_git\_provider) | Git provider for issue repo | `string` | `"hostedgit"` | no |
| <a name="input_issues_repo_git_token_secret_crn"></a> [issues\_repo\_git\_token\_secret\_crn](#input\_issues\_repo\_git\_token\_secret\_crn) | The CRN for the Issues repository Git Token. | `string` | `""` | no |
| <a name="input_issues_repo_git_token_secret_name"></a> [issues\_repo\_git\_token\_secret\_name](#input\_issues\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_issues_repo_initialization_type"></a> [issues\_repo\_initialization\_type](#input\_issues\_repo\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_issues_repo_integration_owner"></a> [issues\_repo\_integration\_owner](#input\_issues\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_issues_repo_is_private_repo"></a> [issues\_repo\_is\_private\_repo](#input\_issues\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_issues_repo_issues_enabled"></a> [issues\_repo\_issues\_enabled](#input\_issues\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `true` | no |
| <a name="input_issues_repo_name"></a> [issues\_repo\_name](#input\_issues\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_issues_repo_secret_group"></a> [issues\_repo\_secret\_group](#input\_issues\_repo\_secret\_group) | Secret group prefix for the Issues repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_issues_repo_traceability_enabled"></a> [issues\_repo\_traceability\_enabled](#input\_issues\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_issues_source_repo_url"></a> [issues\_source\_repo\_url](#input\_issues\_source\_repo\_url) | Url of issue repo template to be cloned | `string` | `""` | no |
| <a name="input_kp_integration_name"></a> [kp\_integration\_name](#input\_kp\_integration\_name) | The name of the Key Protect integration. | `string` | `"kp-compliance-secrets"` | no |
| <a name="input_kp_location"></a> [kp\_location](#input\_kp\_location) | IBM Cloud location/region containing the Key Protect instance. | `string` | `"us-south"` | no |
| <a name="input_kp_name"></a> [kp\_name](#input\_kp\_name) | Name of the Key Protect instance where the secrets are stored. | `string` | `"kp-compliance-secrets"` | no |
| <a name="input_kp_resource_group"></a> [kp\_resource\_group](#input\_kp\_resource\_group) | The resource group containing the Key Protect instance. | `string` | `"Default"` | no |
| <a name="input_link_to_doi_toolchain"></a> [link\_to\_doi\_toolchain](#input\_link\_to\_doi\_toolchain) | Enable a link to a DevOps Insights instance in another toolchain, true or false. | `bool` | `false` | no |
| <a name="input_opt_in_gosec"></a> [opt\_in\_gosec](#input\_opt\_in\_gosec) | Enables gosec scans | `string` | `""` | no |
| <a name="input_opt_in_sonar"></a> [opt\_in\_sonar](#input\_opt\_in\_sonar) | Opt in for Sonarqube. | `string` | `"1"` | no |
| <a name="input_peer_review_compliance"></a> [peer\_review\_compliance](#input\_peer\_review\_compliance) | Set to `1` to enable peer review. | `string` | `"1"` | no |
| <a name="input_pipeline_config_group"></a> [pipeline\_config\_group](#input\_pipeline\_config\_group) | Specify Git user/group for your config repo. | `string` | `""` | no |
| <a name="input_pipeline_config_initialization_type"></a> [pipeline\_config\_initialization\_type](#input\_pipeline\_config\_initialization\_type) | The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`. | `string` | `""` | no |
| <a name="input_pipeline_config_path"></a> [pipeline\_config\_path](#input\_pipeline\_config\_path) | The name and path of the pipeline-config.yaml file within the pipeline-config/app repo | `string` | `".pipeline-config.yaml"` | no |
| <a name="input_pipeline_config_repo_auth_type"></a> [pipeline\_config\_repo\_auth\_type](#input\_pipeline\_config\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_pipeline_config_repo_branch"></a> [pipeline\_config\_repo\_branch](#input\_pipeline\_config\_repo\_branch) | Specify the branch containing the custom pipeline-config.yaml file. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_clone_from_url"></a> [pipeline\_config\_repo\_clone\_from\_url](#input\_pipeline\_config\_repo\_clone\_from\_url) | Specify a repository containing a custom pipeline-config.yaml file | `string` | `""` | no |
| <a name="input_pipeline_config_repo_existing_url"></a> [pipeline\_config\_repo\_existing\_url](#input\_pipeline\_config\_repo\_existing\_url) | Specify a repository containing a custom pipeline-config.yaml file | `string` | `""` | no |
| <a name="input_pipeline_config_repo_git_id"></a> [pipeline\_config\_repo\_git\_id](#input\_pipeline\_config\_repo\_git\_id) | Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_git_provider"></a> [pipeline\_config\_repo\_git\_provider](#input\_pipeline\_config\_repo\_git\_provider) | Git provider for pipeline repo config | `string` | `"hostedgit"` | no |
| <a name="input_pipeline_config_repo_git_token_secret_crn"></a> [pipeline\_config\_repo\_git\_token\_secret\_crn](#input\_pipeline\_config\_repo\_git\_token\_secret\_crn) | The CRN for the Pipeline Config repository Git Token. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_git_token_secret_name"></a> [pipeline\_config\_repo\_git\_token\_secret\_name](#input\_pipeline\_config\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_pipeline_config_repo_integration_owner"></a> [pipeline\_config\_repo\_integration\_owner](#input\_pipeline\_config\_repo\_integration\_owner) | The name of the integration owner. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_is_private_repo"></a> [pipeline\_config\_repo\_is\_private\_repo](#input\_pipeline\_config\_repo\_is\_private\_repo) | Set to `true` to make repository private. | `bool` | `true` | no |
| <a name="input_pipeline_config_repo_issues_enabled"></a> [pipeline\_config\_repo\_issues\_enabled](#input\_pipeline\_config\_repo\_issues\_enabled) | Set to `true` to enable issues. | `bool` | `false` | no |
| <a name="input_pipeline_config_repo_name"></a> [pipeline\_config\_repo\_name](#input\_pipeline\_config\_repo\_name) | The repository name. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_secret_group"></a> [pipeline\_config\_repo\_secret\_group](#input\_pipeline\_config\_repo\_secret\_group) | Secret group prefix for the Pipeline Config repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_traceability_enabled"></a> [pipeline\_config\_repo\_traceability\_enabled](#input\_pipeline\_config\_repo\_traceability\_enabled) | Set to `true` to enable traceability. | `bool` | `false` | no |
| <a name="input_pipeline_debug"></a> [pipeline\_debug](#input\_pipeline\_debug) | Set to '1' to enable debug logging | `string` | `"0"` | no |
| <a name="input_pipeline_dockerconfigjson_secret_crn"></a> [pipeline\_dockerconfigjson\_secret\_crn](#input\_pipeline\_dockerconfigjson\_secret\_crn) | The CRN for Dockerconfig json secret. | `string` | `""` | no |
| <a name="input_pipeline_dockerconfigjson_secret_group"></a> [pipeline\_dockerconfigjson\_secret\_group](#input\_pipeline\_dockerconfigjson\_secret\_group) | Secret group prefix for the pipeline DockerConfigJson secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_pipeline_dockerconfigjson_secret_name"></a> [pipeline\_dockerconfigjson\_secret\_name](#input\_pipeline\_dockerconfigjson\_secret\_name) | Name of the dockerconfigjson secret in the secret provider. | `string` | `"pipeline-dockerconfigjson"` | no |
| <a name="input_pipeline_doi_api_key_secret_crn"></a> [pipeline\_doi\_api\_key\_secret\_crn](#input\_pipeline\_doi\_api\_key\_secret\_crn) | The CRN for the pipeline DOI apikey. | `string` | `""` | no |
| <a name="input_pipeline_doi_api_key_secret_group"></a> [pipeline\_doi\_api\_key\_secret\_group](#input\_pipeline\_doi\_api\_key\_secret\_group) | Secret group prefix for the pipeline DOI api key. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_pipeline_doi_api_key_secret_name"></a> [pipeline\_doi\_api\_key\_secret\_name](#input\_pipeline\_doi\_api\_key\_secret\_name) | Name of the Cloud API key secret in the secret provider to access the toolchain containing the Devops Insights instance. | `string` | `""` | no |
| <a name="input_pipeline_ibmcloud_api_key_secret_crn"></a> [pipeline\_ibmcloud\_api\_key\_secret\_crn](#input\_pipeline\_ibmcloud\_api\_key\_secret\_crn) | The CRN for the IBMCloud apikey. | `string` | `""` | no |
| <a name="input_pipeline_ibmcloud_api_key_secret_group"></a> [pipeline\_ibmcloud\_api\_key\_secret\_group](#input\_pipeline\_ibmcloud\_api\_key\_secret\_group) | Secret group prefix for the pipeline ibmcloud API key secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_pipeline_ibmcloud_api_key_secret_name"></a> [pipeline\_ibmcloud\_api\_key\_secret\_name](#input\_pipeline\_ibmcloud\_api\_key\_secret\_name) | Name of the Cloud API key secret in the secret provider. | `string` | `"ibmcloud-api-key"` | no |
| <a name="input_pipeline_properties"></a> [pipeline\_properties](#input\_pipeline\_properties) | Stringified JSON containing the properties. This takes precedence over the properties JSON. | `string` | `""` | no |
| <a name="input_pipeline_properties_filepath"></a> [pipeline\_properties\_filepath](#input\_pipeline\_properties\_filepath) | The path to the file containing the property JSON. If this is not set, it will by default read the `properties.json` file at the root of the module. | `string` | `""` | no |
| <a name="input_pr_cra_bom_generate"></a> [pr\_cra\_bom\_generate](#input\_pr\_cra\_bom\_generate) | Set this flag to `1` to generate cra bom in PR pipeline | `string` | `"1"` | no |
| <a name="input_pr_cra_deploy_analysis"></a> [pr\_cra\_deploy\_analysis](#input\_pr\_cra\_deploy\_analysis) | Set this flag to `1` for cra deployment analysis to be done in PR pipeline. | `string` | `"1"` | no |
| <a name="input_pr_cra_vulnerability_scan"></a> [pr\_cra\_vulnerability\_scan](#input\_pr\_cra\_vulnerability\_scan) | Set this flag to `1` and `pr-cra-bom-generate` to `1` for cra vulnerability scan in PR pipeline. If this value is set to `1` and `pr-cra-bom-generate` is set to `0`, the scan will be marked as `failure` | `string` | `"1"` | no |
| <a name="input_pr_pipeline_branch"></a> [pr\_pipeline\_branch](#input\_pr\_pipeline\_branch) | The branch within PR pipeline definitions repository for Compliance CI Toolchain. | `string` | `"open-v10"` | no |
| <a name="input_pr_pipeline_git_tag"></a> [pr\_pipeline\_git\_tag](#input\_pr\_pipeline\_git\_tag) | The GIT tag within the PR pipeline definitions repository for Compliance CI Toolchain. | `string` | `""` | no |
| <a name="input_print_code_signing_certificate"></a> [print\_code\_signing\_certificate](#input\_print\_code\_signing\_certificate) | Set to `1` to enable printing of the public signing certificate in the logs. | `string` | `""` | no |
| <a name="input_privateworker_credentials_secret_crn"></a> [privateworker\_credentials\_secret\_crn](#input\_privateworker\_credentials\_secret\_crn) | The CRN for the Private Worker secret secret. | `string` | `""` | no |
| <a name="input_privateworker_credentials_secret_group"></a> [privateworker\_credentials\_secret\_group](#input\_privateworker\_credentials\_secret\_group) | Secret group prefix for the Private Worker secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_privateworker_credentials_secret_name"></a> [privateworker\_credentials\_secret\_name](#input\_privateworker\_credentials\_secret\_name) | Name of the privateworker secret in the secret provider. | `string` | `"private-worker-service-api"` | no |
| <a name="input_privateworker_name"></a> [privateworker\_name](#input\_privateworker\_name) | The name of the private worker integration. | `string` | `"private-worker-tool-01"` | no |
| <a name="input_registry_namespace"></a> [registry\_namespace](#input\_registry\_namespace) | A unique namespace within the IBM Cloud Container Registry region where the application image is stored. | `string` | `"devsecops-ci-registry"` | no |
| <a name="input_registry_region"></a> [registry\_region](#input\_registry\_region) | IBM Cloud Region where the IBM Cloud Container Registry namespace is created. | `string` | `"ibm:yp:us-south"` | no |
| <a name="input_repositories_prefix"></a> [repositories\_prefix](#input\_repositories\_prefix) | Prefix name for the cloned compliance repos. | `string` | `"compliance"` | no |
| <a name="input_repository_properties"></a> [repository\_properties](#input\_repository\_properties) | Stringified JSON containing the repositories and triggers. This takes precedence over the repositories JSON. | `string` | `""` | no |
| <a name="input_repository_properties_filepath"></a> [repository\_properties\_filepath](#input\_repository\_properties\_filepath) | The path to the file containing the repository and triggers JSON. If this is not set, it will by default read the `repositories.json` file at the root of the module. | `string` | `""` | no |
| <a name="input_signing_key_secret_crn"></a> [signing\_key\_secret\_crn](#input\_signing\_key\_secret\_crn) | The CRN for Signing Key secret. | `string` | `""` | no |
| <a name="input_signing_key_secret_group"></a> [signing\_key\_secret\_group](#input\_signing\_key\_secret\_group) | Secret group prefix for the signing key secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
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
| <a name="input_slack_webhook_secret_crn"></a> [slack\_webhook\_secret\_crn](#input\_slack\_webhook\_secret\_crn) | The CRN for the Slack Webhook secret. | `string` | `""` | no |
| <a name="input_slack_webhook_secret_group"></a> [slack\_webhook\_secret\_group](#input\_slack\_webhook\_secret\_group) | Secret group prefix for the Slack webhook secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_slack_webhook_secret_name"></a> [slack\_webhook\_secret\_name](#input\_slack\_webhook\_secret\_name) | Name of the webhook secret in the secret provider. | `string` | `"slack-webhook"` | no |
| <a name="input_sm_instance_crn"></a> [sm\_instance\_crn](#input\_sm\_instance\_crn) | The CRN of the Secrets Manager instance. | `string` | `""` | no |
| <a name="input_sm_integration_name"></a> [sm\_integration\_name](#input\_sm\_integration\_name) | The name of the Secrets Manager integration. | `string` | `"sm-compliance-secrets"` | no |
| <a name="input_sm_location"></a> [sm\_location](#input\_sm\_location) | IBM Cloud location/region containing the Secrets Manager instance. Not required if using a Secrets Manager CRN instance. | `string` | `"us-south"` | no |
| <a name="input_sm_name"></a> [sm\_name](#input\_sm\_name) | Name of the Secrets Manager instance where the secrets are stored. Not required if using a Secrets Manager CRN instance. | `string` | `"sm-compliance-secrets"` | no |
| <a name="input_sm_resource_group"></a> [sm\_resource\_group](#input\_sm\_resource\_group) | The resource group containing the Secrets Manager instance. Not required if using a Secrets Manager CRN instance. | `string` | `"Default"` | no |
| <a name="input_sm_secret_group"></a> [sm\_secret\_group](#input\_sm\_secret\_group) | Group in Secrets Manager for organizing/grouping secrets. | `string` | `"Default"` | no |
| <a name="input_sonarqube_config"></a> [sonarqube\_config](#input\_sonarqube\_config) | Runs a SonarQube scan in an isolated Docker-in-Docker container (default configuration) or in an existing Kubernetes cluster (custom configuration). Options: default or custom. | `string` | `"default"` | no |
| <a name="input_sonarqube_integration_name"></a> [sonarqube\_integration\_name](#input\_sonarqube\_integration\_name) | The name of the SonarQube integration. | `string` | `"SonarQube"` | no |
| <a name="input_sonarqube_is_blind_connection"></a> [sonarqube\_is\_blind\_connection](#input\_sonarqube\_is\_blind\_connection) | When set to `true`, instructs IBM Cloud Continuous Delivery to not validate the configuration of this integration. Set this to true if the SonarQube server is not addressable on the public internet. | `string` | `true` | no |
| <a name="input_sonarqube_secret_crn"></a> [sonarqube\_secret\_crn](#input\_sonarqube\_secret\_crn) | The CRN for the SonarQube secret. | `string` | `""` | no |
| <a name="input_sonarqube_secret_group"></a> [sonarqube\_secret\_group](#input\_sonarqube\_secret\_group) | Secret group prefix for the SonarQube secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`. | `string` | `""` | no |
| <a name="input_sonarqube_secret_name"></a> [sonarqube\_secret\_name](#input\_sonarqube\_secret\_name) | The name of the SonarQube secret. | `string` | `"sonarqube-secret"` | no |
| <a name="input_sonarqube_server_url"></a> [sonarqube\_server\_url](#input\_sonarqube\_server\_url) | The URL to the SonarQube server. | `string` | `""` | no |
| <a name="input_sonarqube_user"></a> [sonarqube\_user](#input\_sonarqube\_user) | The name of the SonarQube user. | `string` | `""` | no |
| <a name="input_toolchain_description"></a> [toolchain\_description](#input\_toolchain\_description) | Description for the CI Toolchain. | `string` | `"Toolchain created with Terraform template for DevSecOps CI Best Practices."` | no |
| <a name="input_toolchain_name"></a> [toolchain\_name](#input\_toolchain\_name) | Name of the CI Toolchain. | `string` | `"DevSecOps CI Toolchain - Terraform"` | no |
| <a name="input_toolchain_region"></a> [toolchain\_region](#input\_toolchain\_region) | IBM Cloud Region for the toolchain. | `string` | `"us-south"` | no |
| <a name="input_toolchain_resource_group"></a> [toolchain\_resource\_group](#input\_toolchain\_resource\_group) | The resource group within which the toolchain is created. | `string` | `"Default"` | no |
| <a name="input_trigger_git_enable"></a> [trigger\_git\_enable](#input\_trigger\_git\_enable) | Set to `true` to enable the CI pipeline Git trigger. | `bool` | `true` | no |
| <a name="input_trigger_git_name"></a> [trigger\_git\_name](#input\_trigger\_git\_name) | The name of the CI pipeline GIT trigger. | `string` | `"Git CI Trigger"` | no |
| <a name="input_trigger_manual_enable"></a> [trigger\_manual\_enable](#input\_trigger\_manual\_enable) | Set to `true` to enable the CI pipeline Manual trigger. | `bool` | `true` | no |
| <a name="input_trigger_manual_name"></a> [trigger\_manual\_name](#input\_trigger\_manual\_name) | The name of the CI pipeline Manual trigger. | `string` | `"Manual Trigger"` | no |
| <a name="input_trigger_manual_pruner_enable"></a> [trigger\_manual\_pruner\_enable](#input\_trigger\_manual\_pruner\_enable) | Set to `true` to enable the manual Pruner trigger. | `bool` | `true` | no |
| <a name="input_trigger_manual_pruner_name"></a> [trigger\_manual\_pruner\_name](#input\_trigger\_manual\_pruner\_name) | The name of the manual Pruner trigger. | `string` | `"Evidence Pruner Manual Trigger"` | no |
| <a name="input_trigger_pr_git_enable"></a> [trigger\_pr\_git\_enable](#input\_trigger\_pr\_git\_enable) | Set to `true` to enable the PR pipeline Git trigger. | `bool` | `true` | no |
| <a name="input_trigger_pr_git_name"></a> [trigger\_pr\_git\_name](#input\_trigger\_pr\_git\_name) | The name of the PR pipeline GIT trigger. | `string` | `"Git PR Trigger"` | no |
| <a name="input_trigger_timed_cron_schedule"></a> [trigger\_timed\_cron\_schedule](#input\_trigger\_timed\_cron\_schedule) | Only needed for timer triggers. Cron expression that indicates when this trigger will activate. Maximum frequency is every 5 minutes. The string is based on UNIX crontab syntax: minute, hour, day of month, month, day of week. Example: 0 *\_/2 * * * - every 2 hours. | `string` | `"0 4 * * *"` | no |
| <a name="input_trigger_timed_enable"></a> [trigger\_timed\_enable](#input\_trigger\_timed\_enable) | Set to `true` to enable the CI pipeline Timed trigger. | `bool` | `false` | no |
| <a name="input_trigger_timed_name"></a> [trigger\_timed\_name](#input\_trigger\_timed\_name) | The name of the CI pipeline Timed trigger. | `string` | `"Git CI Timed Trigger"` | no |
| <a name="input_trigger_timed_pruner_enable"></a> [trigger\_timed\_pruner\_enable](#input\_trigger\_timed\_pruner\_enable) | Set to `true` to enable the timed Pruner trigger. | `bool` | `false` | no |
| <a name="input_trigger_timed_pruner_name"></a> [trigger\_timed\_pruner\_name](#input\_trigger\_timed\_pruner\_name) | The name of the timed Pruner trigger. | `string` | `"Evidence Pruner Timed Trigger"` | no |
| <a name="input_worker_id"></a> [worker\_id](#input\_worker\_id) | The identifier for the Managed Pipeline worker. | `string` | `"public"` | no |

### Outputs

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
| <a name="output_private_worker_id"></a> [private\_worker\_id](#output\_private\_worker\_id) | The ID of the pipeline worker. |
| <a name="output_secret_tool"></a> [secret\_tool](#output\_secret\_tool) | The secret tool. |
| <a name="output_secret_tool_v1"></a> [secret\_tool\_v1](#output\_secret\_tool\_v1) | The legacy secret tool. Used as part of secret references to point to the secret tool integration. This is the legacy version of the secrets tool. The new version was updated to support using different secret groups with Secrests Manager. This only effects Secrets Manager. The net difference is that the legacy secret tool returns the tool name and the secret group name whereas the new tool returns only the tool name. |
| <a name="output_secrets_manager_instance_id"></a> [secrets\_manager\_instance\_id](#output\_secrets\_manager\_instance\_id) | The Secrets Manager instance ID. |
| <a name="output_toolchain_id"></a> [toolchain\_id](#output\_toolchain\_id) | The CI toolchain ID. |
| <a name="output_toolchain_url"></a> [toolchain\_url](#output\_toolchain\_url) | The CI toolchain URL. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- BEGIN CONTRIBUTING HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set up steps for contributors to follow -->
<!-- Source for this readme file: https://github.com/terraform-ibm-modules/common-dev-assets/tree/main/module-assets/ci/module-template-automation -->
<!-- END CONTRIBUTING HOOK -->
