
## DevSecOps CI Toolchain Terraform Template

### Note: Very early access to this terraform toolchain is being provided on as is basis and under active development, variables and variable names might change.

### Introduction

Welcome to the world of Toolchain As Code !!! 

The current project provides code to create DevSecOps CI Reference Toolchain using Terraform Code. In addition to creating the toolchain, the code also creates various toolchain integrations required by the PR (Pull Request) and CI (Continuous Integration) Pipelines.

### Prerequisites

#### Resources

The DevSecOps CI Toolchain requires the following
* A Kubernetes Cluster (For deploying the default Node application sample). See [IBM Cloud Kubernetes Service](https://cloud.ibm.com/docs/containers?topic=containers-getting-started)
* An instance of [Secrets Manager](https://cloud.ibm.com/catalog/services/secrets-manager) with the following named secrets.
   1.  'ibmcloud-api-key' - an apikey for the account containing the toolchain. See [APIKEY](https://cloud.ibm.com/iam/apikeys)
   2. 'signing_key' - a gpg key used to sign image builds. See [Signing Key](https://cloud.ibm.com/docs/devsecops?topic=devsecops-devsecops-image-signing). The most straight forward means to generate the signing key would be to do the following. Add the secret to your instance of Secrets Manager by going through the setup wizard for the DevSecOps Compliance CI toolchain and jump to the 'Image Signing' step and click "New", then save that key to your Secrets Manager instance.

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
Run 'terraform -help'

##### Other Platforms
For additional platforms please see https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli



### Terraform Commands (basic)
1. terraform init - this command initialises the working directory containing the Terraform configuration files
2. terraform plan - a command that provides a preview of the actions that Terraform will perform on your infrastructure.
3. terraform apply - the command to perform the infrastructure modifications outlined using the plan command. 
4. terraform destroy - the command to delete all the resources managed by the Terraform project.
5. terraform help - lists and describes Terraform CLI commands

### Setup and create the toolchain

The following steps will create the default CI toolchain with the example application deploying to your Kubernetes cluster

1. Download the repository
2. cd into the downloaded directory
3. Rename the **`variables.tfvars.example`** to **`terraform.tfvars`**.
4. Provide appropriate values for the variables in the **`terraform.tfvars`** to point to various resources within your account. It is expected that the Secrets Manager already has the secrets outlined earlier. The example terraform.tfvars file contains all the required and optional variables. At a minimum the required variables are as follows:
   - toolchain_resource_group
   - toolchain_region
   - toolchain_name
   - ibm_cloud_api_key
   - cluster_name
   - cluster_namespace
   - dev_region
   - dev_resource_group
   - registry_namespace
   - registry_region
   - sm_resource_group
   - sm_location
   - sm_name
   - sm_secret_group

   Pay attention to values that use 'Default'. Some accounts might require it in lower case 'default'.
   Other variables can be deleted.

5. Run the terraform initialization command. Only needs to be run once. Multiple runs does not cause problems.

```
	terraform init
```
   You should see an output similar to
```
	Initializing modules...
	- integrations in integrations
	- pipeline-ci in pipeline-ci
	- pipeline-pr in pipeline-pr
	- repositories in repositories
	- services in services

	Initializing the backend...

	Initializing provider plugins...
	- Finding ibm-cloud/ibm versions matching ">= 1.48.0"...
	- Installing ibm-cloud/ibm v1.48.0...
	- Installed ibm-cloud/ibm v1.48.0 (self-signed, key ID AAD3B791C49CC253)
```
6. Run the plan command. This will generate an output showing resources that will be created and highlight potential issues

```
    terraform plan
```

7. Run the apply command which will create all the resources

```
   terraform apply
```

You should see a similar output
```
app_repo_url = "https://github.ibm.com/HUAYUENH/ci-ce-example.git"
ci_pipeline_id = "ee951d12-2305-4a5c-97d8-504b5fd678f6"
evidence_repo_url = "https://us-south.git.cloud.ibm.com/huayuenh/compliance-tf-evidence-repo.git"
inventory_repo_url = "https://us-south.git.cloud.ibm.com/huayuenh/compliance-tf-inventory-repo.git"
issues_repo_url = "https://us-south.git.cloud.ibm.com/huayuenh/compliance-tf-issues-repo.git"
pipeline_repo_url = "https://us-south.git.cloud.ibm.com/open-toolchain/compliance-pipelines.git"
pr_pipeline_id = "de5c3af4-02a8-45bc-9ed8-beaba0359950"
secret_tool = "sm-compliance-secrets.Default"
secrets_manager_instance_id = "cd1472b8-9a3a-481e-96a1-55515bcc574f"
toolchain_id = "847b26ec-d7f4-41b9-a90d-e73ec3a927ce"

```

Take note of the outputs. The values can be used for setting up the DevSecOps Terraform CD and CC toolchains

8. The new toolchain should now be visible in your account
You can navigate directly to it by going to
```
   https://cloud.ibm.com/devops/toolchains/{toolchain_id}?env_id=ibm:yp:us-south
```

Where {toolchain_id} is replaced with the toolchain_id value from the output
```
   https://cloud.ibm.com/devops/toolchains/847b26ec-d7f4-41b9-a90d-e73ec3a927ce?env_id=ibm:yp:us-south
```
### Configurability
See the complete list of supported variables and their descriptions in the next section. The Terraform tfvars file can be populated with variables to clone other application repositories or link to your existing ones . 
###### Clone
- app_repo_clone_from_url
- app_repo_clone_from_branch

or
###### Link (existing)
- app_repo_existing_url
- app_repo_existing_branch



### Complete list of supported variables
| Variables      | Description | 
| ---           | ----        | 
| toolchain_resource_group  | Resource Group for the toolchain     |
| toolchain_region          | IBM Cloud Region for the toolchain |
| toolchain_name            | Name for the toolchain      |
| toolchain_description     | Description for the toolchain |
| app_name                  | Name of the application image and inventory entry. |
| repositories_prefix       | Prefix name for the cloned compliance repos. |
| ibm_cloud_api_key         | IBM Cloud API KEY to fetch/post cloud resources in terraform. Not used in the pipeline, where a secret reference is used instead. |
| ibm_cloud_api             | IBM Cloud API Endpoint     |
|authorization_policy_creation| Disable Service to Service Authorization Policy creation for secrets resolution. Set to "disabled" if you do not want this policy auto created|
| pipeline_ibmcloud_api_key_secret_name|Default 'ibmcloud-api-key'. The name of the secret in the secrets provider for the apikey used in the pipeline|
| signing_key_secret_name|Default 'signing-key'. The name of the secret in the secrets provider for the signing key|
| cos_api_key_secret_name|Default 'cos-api-key'. The name of the secret in the secrets provider for the COS api key|
|**Variables for Repositories** |
| app_repo_clone_from_url    | (Optional) Override the default sample app by providing your own sample app url, which will be cloned into the app repo. Note, using clone_if_not_exists mode, so if the app repo already exists the repo contents are unchanged. |
| app_repo_clone_from_branch | (Optional) Used when app_repo_clone_from_url is provided, the default branch that will be used by the CI build, usually either main or master. | 
| app_repo_clone_to_git_provider | By default 'hostedgit', else use 'githubconsolidated' or 'gitlab' |
| app_repo_clone_to_git_id   | By default absent, else custom server GUID, or other options for 'git_id' field in the browser UI. | 
| app_repo_existing_url      | (Optional) Override to bring your own existing application repository URL, which will be used directly instead of cloning the default sample.   |
| app_repo_existing_branch   | Used when app_repo_existing_url is provided, the default branch that will be used by the CI build, usually either main or master.   |
| app_repo_existing_git_provider | By default 'hostedgit', else use 'githubconsolidated' or 'gitlab'. | 
| app_repo_existing_git_id   | By default absent, else custom server GUID, or other options for 'git_id' field in the browser UI. |
| pipeline_config_repo_existing_url | The URL of an existing GRIT repository containing the pipeline-config.yaml |
| pipeline_config_repo_branch  | the branch of the repository containing the pipeline-config.yaml |
| pipeline_config_path | By default: ".pipeline-config.yaml". The path of the pipeline-config.yaml file in the specified repository|
| app_group         | GRIT group where application repository will be created    |
| issues_group         | GRIT group where issues repository will be created    |
| inventory_group         | GRIT group where inventory repository will be created    |
| evidence_group         | GRIT group where evidence repository will be created    |
|**Variables for Services** |
| cluster_name              | IBM Cloud IKS Cluster name where the sample application is to be deployed by the toolchain    |
| cluster_namespace         | Namespace within the IBM Cloud IKS Cluster where the sample application is to be deployed  |
| dev_region                | IBM Cloud IKS Cluster region |
| dev_resource_group        | The cluster resource group |
| registry_namespace        | IBM Cloud ICR Namespace where the docker image built for the application is to be pushed |
| registry_region           | IBM Cloud Region where the IBM Cloud Container Registry namespace is to be created. |
| enable_secrets_manager    | Bool. Default: true. Use a Secrets Manager integration for the secrets.             |
| enable_key_protect        | Bool. Default: false. Use a Key Protect integration for the secrets.                |
| sm_resource_group         | The resource group containing the Secrets Manager instance for your secrets. |
| sm_location               | IBM Cloud location/region containing the Secrets Manager instance. |
| sm_name                   | Name of the Secrets Manager instance where the secrets are stored. |
| sm_secret_group           | The Secrets Manager secret group containing your secrets. |
| kp_resource_group         | The resource group containing the Key Protect instance for your secrets. |
| kp_location               | IBM Cloud location/region containing the Key Protect instance.           |
| kp_name                   | Name of the Key Protect instance where the secrets are stored            |
| cos_endpoint              | Cloud Object Storage endpoint name |
| cos_bucket_name           | Cloud Object Storage bucket name |
| link_to_doi_toolchain     | Default 'false'. Use a custom tool integration to link to an existing DevOpsInsights integration using 'doi_toolchain_id' |
| doi_toolchain_id          | The Id of the toolchain containing the instance of DevOpsInsights
|**Variables for Code Engine** |
| deployment_target         | set as 'code-engine' for Code Engine. Defaults to Kubernetes |
| code_engine_project       | The name of the Code Engine project|
| code_engine_region        | The region for Code Engine         |
| code_engine_resource_group | The resource group for Code Engine |
| code_engine_entity_type    | 'application' or 'job' type       |
| code_engine_build_strategy | 'dockerfile' or 'buildpacks'      |
| code_engine_source         | path to the code with the repo    |

