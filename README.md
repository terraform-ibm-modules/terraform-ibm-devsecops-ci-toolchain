
## DevSecOps CI Toolchain Terraform Template

### Introduction

Welcome to the world of Toolchain As Code !!! 

The current project provides code to create DevSecOps CI Reference Toolchain using Terraform Code. Inaddtion to creating the toolchain, the code also creates various toolchain integrations required by the PR (Pull Request) and CI (Continuous Integration) Pipelines.

### Prerequisites

### Code Structure

The terraform code for DevSecOps CI Toolchain comprises of different folders to provide a logical grouping of various resources. 
Terraform considers each folder as a module, and hence each of these logical groups (folders) are treated by terraform as seperate modules.

 1. repositories
Resource definitions for all the repositories required for the DevSecOps CI Toolchain. All these repositories are created as **`ibm_cd_toolchain_tool_hostedgit`** Toolchain Integrations. By default, the terrform template **`clones`** these repositories in your GRIT (default provider) account. If you wish to use a different provider please update the resource type in **`repositories/repositories.tf`** file. The repository types supported are:

| Terraform Type      									| Description | 
| ---           										| ----        | 
| ibm_cd_toolchain_tool_githubconsolidated            	| Github instance			     	|
| ibm_cd_toolchain_tool_githubintegrated            	| Github Whitewater Instance     	|
| ibm_cd_toolchain_tool_gitlab            				| Native Gitlab Instance     		|
| ibm_cd_toolchain_tool_hostedgit            			| IBM Hosted Gitlab Instance	    |

2. pipeline-pr
Resource definitions for setting up the tekton delivery pipeline. The toolchain i.e. the main module itself creates **`ibm_cd_toolchain_tool_pipeline`** Toolchain Integration. However, all the other resource required by the Delivery Pipeline itself are created within this module. These resources primarily includes
	 - Tekton Pipeline 
	 - Tekton Pipeline Definitions ( DevSecOps Compliance )
	 - Tekton Pipeline Triggers
     - Tekton Pipeline Environment Variables
 
3. pipeline-ci 
Resource definitions for setting up the tekton delivery pipeline. The toolchain i.e. the main module itself creates **`ibm_cd_toolchain_tool_pipeline`** Toolchain Integration. However, all the other resource required by the Delivery Pipeline itself are created within this module. These resources primarily includes
	 - Tekton Pipeline 
	 - Tekton Pipeline Definitions ( DevSecOps Compliance )
	 - Tekton Pipeline Triggers
     - Tekton Pipeline Environment Variables

> While referring any environment variables from Secret Store ( Key Protect, Secrets Manager ) use the below syntax
> ```
> resource "ibm_cd_tekton_pipeline_property" "ci_pipeline_signing_key" {
>  name           = "signing-key"
>  type           = "secure"
>  value          = format("{vault::%s.signing-key}", var.kp_integration_name)
>  pipeline_id    = ibm_cd_tekton_pipeline.ci_pipeline_instance.pipeline_id
> }
>```

4. integrations
Toolchain Integrations required by the toolchain are created here. Currently, the toolchain creates following integrations. More integrations will be added soon.
	 - Key Protect 
	 - Cloud Object Store 
	 - Slack 
	 - DevOps Insight 

5. service
Toolchain can leverage information about other IBM Cloud Services like IKS Cluster, ICR, COS and can lookup respective resources via terraform data sources which can then be used to setup up other integrations.
	 - IBM Cloud IKS Cluster `ibm_container_cluster` 
	 - IBM Cloud ICR `ibm_cr_namespaces` 
	 - IBM Cloud Resource for Key Protect `ibm_resource_instance`

6. main
The main module is where all the other modules are instantiated. The current dependencies between various module and also on the main module is depicted below.

	 - repositories - Independent
	 - services - Independent
	 - integrations - repositories, services
	 - pipeline-ci - repositories, services, integrations
	 - pipeline-pr - repositories, services, integrations

### Setup and Run the template

1. Rename the **`variables.tfvars.example`** to **`terraform.tfvars`**.

3. Provide appropriate values for the variables in the **`terraform.tfvars`** to point to various resources within your account.

| Variable      | Description | 
| ---           | ----        | 
| toolchain_resource_group  | Resource Group for the toolchain     |
| toolchain_region          | IBM Cloud Region for the toolchain |
| toolchain_name            | Name for the toolchain      |
| toolchain_description     | Description for the toolchain |
| app_name                  | Name of the application       |
| app_image_name            | Name of the docker image for the application     |
| ibm_cloud_api_key         | IBM Cloud API KEY to fetch/post cloud resources in terraform. Not used in the pipeline, where a secret reference is used instead. |
| ibm_cloud_api             | IBM Cloud API Endpoint     |
|: Variable for Repositories : |
| app_repo_clone_from_url    | (Optional) Override the default sample app by providing your own sample app url, which will be cloned into the app repo. Note, using clone_if_not_exists mode, so if the app repo already exists the repo contents are unchanged. |
| app_repo_clone_from_branch | (Optional) Used when app_repo_clone_from_url is provided, the default branch that will be used by the CI build, usually either main or master. | 
| app_repo_existing_url     | (Optional) Override to bring your own existing application repository URL, which will be used directly instead of cloning the default sample.   |
| app_repo_existing_branch   | Used when app_repo_existing_url is provided, the default branch that will be used by the CI build, usually either main or master.   |
| app_repo_type             | hostedgit, github     |
|:    Variables for Services    :|
| cluster_name              | IBM Cloud IKS Cluster name where the sample application is to be deployed by the toolchain    |
| cluster_namespace         | Namespace within the IBM Cloud IKS Cluster where the sample application is to be deployed  |
| dev_region                | IBM Cloud IKS Cluster region |
| dev_resource_group        | The cluster resource group |
| registry_namespace        | IBM Cloud ICR Namespace where the docker image built for the application is to be pushed |
| kp_name                   | Name of the Key Protect Instance within your account from where secrets are to be referred  |
| kp_region                 | IBMCloud Region of the Key Protect Instance within your account from where secrets are to be referred  |
| sm_resource_group         | The resource group containing the Secrets Manager instance for your secrets. |
| sm_location               | IBM Cloud location containing the Secrets Manager instance. |
| sm_name                   | Name of the Secrets Manager instance where the secrets are stored. |
| sm_secret_group           | The Secrets Manager secret group containing your secrets. |
| cos_endpoint              | Cloud Object Storage endpoint name |
| cos_bucket_name           | Cloud Object Storage bucket name |

4. Run the terraform initialization command
```
terraform init
```
You should see an output similiar to below
```
Initializing modules...
- integrations in integrations
- pipeline-ci in pipeline-ci
- pipeline-pr in pipeline-pr
- repositories in repositories
- services in services

Initializing the backend...

Initializing provider plugins...
- Finding ibm-cloud/ibm versions matching "1.48.0"...
- Installing ibm-cloud/ibm v1.48.0...
- Installed ibm-cloud/ibm v1.48.0 (self-signed, key ID AAD3B791C49CC253)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```
