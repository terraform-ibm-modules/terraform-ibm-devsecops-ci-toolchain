<!-- BEGIN MODULE HOOK -->

<!-- Update the title to match the module name and add a description -->

# Terraform IBM DevSecOps CI Toolchain

A Terraform module for provisioning the DevSecOps CI toolchain.

<!-- Remove the content in this H2 heading after completing the steps -->
<!-- Remove the content in this previous H2 heading -->

<!-- NO PERMISSIONS FOR MODULE
If no permissions are required for the module, uncomment the following
statement instead the previous block.
-->

<!-- No permissions are needed to run this module.-->
<!-- END MODULE HOOK -->
<!-- BEGIN EXAMPLES HOOK -->

## Setup Terraform

#### Terraform CLI Installation

The Terraform CLI is a command line application from HashiCorp that is required to run the different Terraform commands.

##### MacOS

Run the following to install the Hashicorp repository of Homebrew packages

- brew tap hashicorp/tap

- brew install hashicorp/tap/terraform

##### RHEL/yum

- sudo yum install -y yum-utils
- sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/$release/hashicorp.repo

- yum install terraform

##### Ubuntu

- sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

- wget -O- https://apt.releases.hashicorp.com/gpg | \
   gpg --dearmor | \
   sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

- gpg --no-default-keyring \
   --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
   --fingerprint

- echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
   https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
   sudo tee /etc/apt/sources.list.d/hashicorp.list

- sudo apt update

- sudo apt-get install terraform

##### Verify Installation

Run `terraform -help`

##### Other Platforms

For additional platforms please see https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

### Terraform Commands (basic)

1. `terraform init` - this command initialises the working directory containing the Terraform configuration files
2. `terraform plan` - a command that provides a preview of the actions that Terraform will perform on your infrastructure.
3. `terraform apply` - the command to perform the infrastructure modifications outlined using the plan command.
4. `terraform destroy` - the command to delete all the resources managed by the Terraform project.
5. `terraform help` - lists and describes Terraform CLI commands

## Usage

Before beginning see the [Prerequisites](#prerequisites) and [Required IAM access policies](#iamaccess) sections

### Setup

The following steps create the out of the box setup for the CC Toolchains. Read through the example .tfvars file for a quick set up and see the [inputs](#inputs) for all modifiable settings.

- Clone this [repo](https://github.com/terraform-ibm-modules/terraform-ibm-devsecops-alm) to a local directory
- `cd` into the cloned directory
- Run `terraform init` to download the required modules and plugins
- Supply a `terraform.tfvars` file with the required variables. See the provided example at the root of the repo
- Rename the `variables.tfvars.example` to `variables.tfvars.example`
- The snippet below shows the minumum required details to set up the CI toolchain. Read the notes in [inputs](#inputs) file for more details
- Run `terraform plan -var-files 'path-to-variables.tfvars'` to generate a plan and check to for potential problems
- Run `terraform apply -var-files 'path-to-variables.tfvars'` to execute the Terraform commands

After a successful Terraform run, login into [IBM Cloud](https://cloud.ibm.com/) and look at the [Toolchains](https://cloud.ibm.com/devops/toolchains?env_id=ibm:yp:us-south) section to find your newly created DevSecOps toolchains.

```hcl
ibmcloud_api_key          = "{set your ibmcloud apikey}"
toolchain_region          = "us-south"
toolchain_name            = "DevSecOps CI Toolchain - Terraform"
registry_namespace        = "my-namespace"
cluster_name              = "mycluster-free"
cluster_namespace         = "devsecops-ci-ns"
dev_region                = "ibm:yp:us-south"
dev_resource_group        = "Default"
registry_region           = "ibm:yp:us-south"
sm_name                   = "sm-prod-dal"
sm_location               = "us-south"
sm_secret_group           = "Default"
sm_resource_group         = "Default"
```

### <a id="prerequisites"></a>Prerequisites

#### IBM Cloud account

Set up an [IBM Cloud account](https://cloud.ibm.com/registration). Depending on your IBM Cloud account type, access to certain resources might be limited. Depending on your account plan limits, certain capabilities that are required by some DevSecOps toolchains might not be available. For more information, see [Setting up your IBM Cloud account](https://cloud.ibm.com/docs/account?topic=account-account-getting-started) and [Upgrading your account](https://cloud.ibm.com/docs/account?topic=account-upgrading-account).

#### Continuous Delivery Service.

This is the service underpinning the repositories and pipelines in the toolchain. While the toolchains can be created without this service, they are highly restricted. See [Continuous Delivery](https://cloud.ibm.com/catalog/services/continuous-delivery)

#### Secrets Management Vault

Ensure that all of the secret values that you need are stored in a secrets management vault. [Managing IBM Cloud secrets](https://cloud.ibm.com/docs/secrets-manager?topic=secrets-manager-manage-secrets-ibm-cloud) can help you to choose from various secrets management and data protection offerings. If you don't already have an instance of the secrets management vault provider of your choice, create one. For information about IBM Cloud® Secrets Manager, see [Getting started with Secrets Manager](https://cloud.ibm.com/docs/secrets-manager?topic=secrets-manager-getting-started).

#### Kubernetes cluster

Create a [Kubernetes cluster](https://cloud.ibm.com/kubernetes/catalog/cluster/create). While you are evaluating the service, you can use the Free pricing plan. The cluster might take some time to provision. As the cluster is created, it progresses through these stages: Deploying, Pending, and Ready. [Learn more](https://cloud.ibm.com/docs/Registry?topic=Registry-getting-started).

#### Container Registry namespace

Create an [IBM Cloud® Container Registry namespace](https://cloud.ibm.com/registry/namespaces). IBM Cloud Container Registry provides a multi-tenant private image registry that you can use to store and share your container images with users in your IBM Cloud account. Select the location for your namespace, and click Create. [Learn more](https://cloud.ibm.com/docs/Registry?topic=Registry-getting-started).

#### Signing Key

[Create an image signing key](https://cloud.ibm.com/docs/devsecops?topic=devsecops-devsecops-image-signing) with the proper encoding to sign your application docker images.

#### IBM Cloud API key

Create an [IBM Cloud API key](https://cloud.ibm.com/iam/apikeys). Save the API key value by either copying, downloading it or adding it to your vault.

#### IBM Cloud Object Storage (Optional)

Create an [IBM Cloud Object Storage instance and bucket](https://cloud.ibm.com/docs/devsecops?topic=devsecops-cd-devsecops-cos-config). [Learn more](https://cloud.ibm.com/docs/cloud-object-storage?topic=cloud-object-storage-about-cloud-object-storage).

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >=1.52.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_integrations"></a> [integrations](#module\_integrations) | ./integrations | n/a |
| <a name="module_pipeline_ci"></a> [pipeline\_ci](#module\_pipeline\_ci) | ./pipeline-ci | n/a |
| <a name="module_pipeline_pr"></a> [pipeline\_pr](#module\_pipeline\_pr) | ./pipeline-pr | n/a |
| <a name="module_repositories"></a> [repositories](#module\_repositories) | ./repositories | n/a |
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
| <a name="input_app_repo_template_url"></a> [app\_repo\_template\_url](#input\_app\_repo\_template\_url) | Url of app repo template to be cloned | `string` | `""` | no |
| <a name="input_app_version"></a> [app\_version](#input\_app\_version) | The version of the app to deploy. | `string` | `"v1"` | no |
| <a name="input_artifactory_dashboard_url"></a> [artifactory\_dashboard\_url](#input\_artifactory\_dashboard\_url) | Type the URL that you want to navigate to when you click the Artifactory integration tile. | `string` | `""` | no |
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
| <a name="input_enable_key_protect"></a> [enable\_key\_protect](#input\_enable\_key\_protect) | Set to enable Key Protect Integration. | `bool` | `false` | no |
| <a name="input_enable_pipeline_dockerconfigjson"></a> [enable\_pipeline\_dockerconfigjson](#input\_enable\_pipeline\_dockerconfigjson) | Enable to add the pipeline-dockerconfigjson to the pipeline properties | `bool` | `false` | no |
| <a name="input_enable_privateworker"></a> [enable\_privateworker](#input\_enable\_privateworker) | Set true to enable private worker  for devsecops. | `bool` | `false` | no |
| <a name="input_enable_secrets_manager"></a> [enable\_secrets\_manager](#input\_enable\_secrets\_manager) | Set to enable Secrets Manager Integration. | `bool` | `true` | no |
| <a name="input_enable_slack"></a> [enable\_slack](#input\_enable\_slack) | Set to true to create the integration | `bool` | `false` | no |
| <a name="input_evidence_group"></a> [evidence\_group](#input\_evidence\_group) | Specify Git user/group for evidence repository. | `string` | `""` | no |
| <a name="input_evidence_repo_auth_type"></a> [evidence\_repo\_auth\_type](#input\_evidence\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_evidence_repo_git_provider"></a> [evidence\_repo\_git\_provider](#input\_evidence\_repo\_git\_provider) | Git provider for evidence repo | `string` | `"hostedgit"` | no |
| <a name="input_evidence_repo_git_token_secret_name"></a> [evidence\_repo\_git\_token\_secret\_name](#input\_evidence\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_evidence_source_repo_url"></a> [evidence\_source\_repo\_url](#input\_evidence\_source\_repo\_url) | Url of evidence repo template to be cloned | `string` | `""` | no |
| <a name="input_ibmcloud_api"></a> [ibmcloud\_api](#input\_ibmcloud\_api) | IBM Cloud API Endpoint. | `string` | `"https://cloud.ibm.com"` | no |
| <a name="input_ibmcloud_api_key"></a> [ibmcloud\_api\_key](#input\_ibmcloud\_api\_key) | API key used to create the toolchains. | `string` | n/a | yes |
| <a name="input_inventory_group"></a> [inventory\_group](#input\_inventory\_group) | Specify Git user/group for inventory repository. | `string` | `""` | no |
| <a name="input_inventory_repo_auth_type"></a> [inventory\_repo\_auth\_type](#input\_inventory\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_inventory_repo_git_provider"></a> [inventory\_repo\_git\_provider](#input\_inventory\_repo\_git\_provider) | Git provider for inventory repo | `string` | `"hostedgit"` | no |
| <a name="input_inventory_repo_git_token_secret_name"></a> [inventory\_repo\_git\_token\_secret\_name](#input\_inventory\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_inventory_source_repo_url"></a> [inventory\_source\_repo\_url](#input\_inventory\_source\_repo\_url) | Url of inventory repo template to be cloned | `string` | `""` | no |
| <a name="input_issues_group"></a> [issues\_group](#input\_issues\_group) | Specify Git user/group for issues repository. | `string` | `""` | no |
| <a name="input_issues_repo_auth_type"></a> [issues\_repo\_auth\_type](#input\_issues\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_issues_repo_git_provider"></a> [issues\_repo\_git\_provider](#input\_issues\_repo\_git\_provider) | Git provider for issue repo | `string` | `"hostedgit"` | no |
| <a name="input_issues_repo_git_token_secret_name"></a> [issues\_repo\_git\_token\_secret\_name](#input\_issues\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_issues_source_repo_url"></a> [issues\_source\_repo\_url](#input\_issues\_source\_repo\_url) | Url of issue repo template to be cloned | `string` | `""` | no |
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
| <a name="input_pipeline_config_path"></a> [pipeline\_config\_path](#input\_pipeline\_config\_path) | The name and path of the pipeline-config.yaml file within the pipeline-config/app repo | `string` | `".pipeline-config.yaml"` | no |
| <a name="input_pipeline_config_repo_auth_type"></a> [pipeline\_config\_repo\_auth\_type](#input\_pipeline\_config\_repo\_auth\_type) | Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat' | `string` | `"oauth"` | no |
| <a name="input_pipeline_config_repo_branch"></a> [pipeline\_config\_repo\_branch](#input\_pipeline\_config\_repo\_branch) | Specify the branch containing the custom pipeline-config.yaml file. | `string` | `""` | no |
| <a name="input_pipeline_config_repo_clone_from_url"></a> [pipeline\_config\_repo\_clone\_from\_url](#input\_pipeline\_config\_repo\_clone\_from\_url) | Specify a repository containing a custom pipeline-config.yaml file | `string` | `""` | no |
| <a name="input_pipeline_config_repo_existing_url"></a> [pipeline\_config\_repo\_existing\_url](#input\_pipeline\_config\_repo\_existing\_url) | Specify a repository containing a custom pipeline-config.yaml file | `string` | `""` | no |
| <a name="input_pipeline_config_repo_git_provider"></a> [pipeline\_config\_repo\_git\_provider](#input\_pipeline\_config\_repo\_git\_provider) | Git provider for pipeline repo config | `string` | `"hostedgit"` | no |
| <a name="input_pipeline_config_repo_git_token_secret_name"></a> [pipeline\_config\_repo\_git\_token\_secret\_name](#input\_pipeline\_config\_repo\_git\_token\_secret\_name) | Name of the Git token secret in the secret provider. | `string` | `"git-token"` | no |
| <a name="input_pipeline_debug"></a> [pipeline\_debug](#input\_pipeline\_debug) | Set to '1' to enable debug logging | `string` | `"0"` | no |
| <a name="input_pipeline_dockerconfigjson_secret_name"></a> [pipeline\_dockerconfigjson\_secret\_name](#input\_pipeline\_dockerconfigjson\_secret\_name) | Name of the dockerconfigjson secret in the secret provider. | `string` | `"pipeline-dockerconfigjson"` | no |
| <a name="input_pipeline_ibmcloud_api_key_secret_name"></a> [pipeline\_ibmcloud\_api\_key\_secret\_name](#input\_pipeline\_ibmcloud\_api\_key\_secret\_name) | Name of the Cloud API key secret in the secret provider. | `string` | `"ibmcloud-api-key"` | no |
| <a name="input_pipeline_repo_url"></a> [pipeline\_repo\_url](#input\_pipeline\_repo\_url) | Url of pipeline repo template to be cloned | `string` | `""` | no |
| <a name="input_pr_pipeline_branch"></a> [pr\_pipeline\_branch](#input\_pr\_pipeline\_branch) | The branch within pr pipeline definitions repository for Compliance CI Toolchain. | `string` | `"open-v9"` | no |
| <a name="input_privateworker_credentials_secret_name"></a> [privateworker\_credentials\_secret\_name](#input\_privateworker\_credentials\_secret\_name) | Name of the privateworker secret in the secret provider. | `string` | `"private-worker-service-api"` | no |
| <a name="input_registry_namespace"></a> [registry\_namespace](#input\_registry\_namespace) | A unique namespace within the IBM Cloud Container Registry region where the application image is stored. | `string` | `"devsecops-ci-registry"` | no |
| <a name="input_registry_region"></a> [registry\_region](#input\_registry\_region) | IBM Cloud Region where the IBM Cloud Container Registry namespace is created. | `string` | `"ibm:yp:us-south"` | no |
| <a name="input_repositories_prefix"></a> [repositories\_prefix](#input\_repositories\_prefix) | Prefix name for the cloned compliance repos. | `string` | `"compliance"` | no |
| <a name="input_signing_key_secret_name"></a> [signing\_key\_secret\_name](#input\_signing\_key\_secret\_name) | Name of the signing key secret in the secret provider. | `string` | `"signing_key"` | no |
| <a name="input_slack_channel_name"></a> [slack\_channel\_name](#input\_slack\_channel\_name) | The Slack channel that notifications are posted to. | `string` | `"my-channel"` | no |
| <a name="input_slack_notifications"></a> [slack\_notifications](#input\_slack\_notifications) | The switch that turns the Slack integration on or off. | `string` | `"0"` | no |
| <a name="input_slack_pipeline_fail"></a> [slack\_pipeline\_fail](#input\_slack\_pipeline\_fail) | Generate pipeline failed notifications. | `bool` | `true` | no |
| <a name="input_slack_pipeline_start"></a> [slack\_pipeline\_start](#input\_slack\_pipeline\_start) | Generate pipeline start notifications. | `bool` | `true` | no |
| <a name="input_slack_pipeline_success"></a> [slack\_pipeline\_success](#input\_slack\_pipeline\_success) | Generate pipeline succeeded notifications. | `bool` | `true` | no |
| <a name="input_slack_team_name"></a> [slack\_team\_name](#input\_slack\_team\_name) | The Slack team name, which is the word or phrase before .slack.com in the team URL. | `string` | `"my-team"` | no |
| <a name="input_slack_toolchain_bind"></a> [slack\_toolchain\_bind](#input\_slack\_toolchain\_bind) | Generate tool added to toolchain notifications. | `bool` | `true` | no |
| <a name="input_slack_toolchain_unbind"></a> [slack\_toolchain\_unbind](#input\_slack\_toolchain\_unbind) | Generate tool removed from toolchain notifications. | `bool` | `true` | no |
| <a name="input_slack_webhook_secret_name"></a> [slack\_webhook\_secret\_name](#input\_slack\_webhook\_secret\_name) | Name of the webhook secret in the secret provider. | `string` | `"slack-webhook"` | no |
| <a name="input_sm_location"></a> [sm\_location](#input\_sm\_location) | IBM Cloud location/region containing the Secrets Manager instance. | `string` | `"us-south"` | no |
| <a name="input_sm_name"></a> [sm\_name](#input\_sm\_name) | Name of the Secrets Manager instance where the secrets are stored. | `string` | `"sm-compliance-secrets"` | no |
| <a name="input_sm_resource_group"></a> [sm\_resource\_group](#input\_sm\_resource\_group) | The resource group containing the Secrets Manager instance. | `string` | `"Default"` | no |
| <a name="input_sm_secret_group"></a> [sm\_secret\_group](#input\_sm\_secret\_group) | Group in Secrets Manager for organizing/grouping secrets. | `string` | `"Default"` | no |
| <a name="input_sonarqube_config"></a> [sonarqube\_config](#input\_sonarqube\_config) | Runs a SonarQube scan in an isolated Docker-in-Docker container (default configuration) or in an existing Kubernetes cluster (custom configuration). Options: default or custom. | `string` | `"default"` | no |
| <a name="input_toolchain_description"></a> [toolchain\_description](#input\_toolchain\_description) | Description for the CI Toolchain. | `string` | `"Toolchain created with Terraform template for DevSecOps CI Best Practices."` | no |
| <a name="input_toolchain_name"></a> [toolchain\_name](#input\_toolchain\_name) | Name of the CI Toolchain. | `string` | `"DevSecOps CI Toolchain - Terraform"` | no |
| <a name="input_toolchain_region"></a> [toolchain\_region](#input\_toolchain\_region) | IBM Cloud Region for the toolchain. | `string` | `"us-south"` | no |
| <a name="input_toolchain_resource_group"></a> [toolchain\_resource\_group](#input\_toolchain\_resource\_group) | The resource group within which the toolchain is created. | `string` | `"Default"` | no |

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
