## DevSecOps CI Toolchain Terraform Template

#### Introduction

#### Code Structure

The terraform code for DevSecOps CI Toolchain comprises of different folders to provide a logical grouping of various resources. 
Terraform considers each folder as a module, and hence each of these logical groups (folders) are treated by terraform as seperate modules.

1. repositories

Resource definitions for all the repositories required for the DevSecOps CI Toolchain. All these repositories are created as **`ibm_toolchain_tool_git`** Toolchain Integrations. By default, the terrform template **`clones`** these repositories in your GRIT (default provider) account. If you wish to use a different provider please update the variables in **`variables.tf`** file. The repositories created are:
        1. Application Repository
        2. Pipeline Repository
        3. Evidence Repository
        4. Inventory Repository
        5. Issues/Incidence Repository

2. pipeline-pr

Resource definitions for setting up the tekton delivery pipeline. The toolchain i.e. the main module itself creates **`ibm_toolchain_tool_pipeline`** Toolchain Integration. However, all the other resource required by the Delivery Pipeline itself are created within this module. These resources primarily includes
    1. Tekton Pipeline
    2. Tekton Pipeline Definitions ( DevSecOps Compliance )
    3. Tekton Pipeline Triggers

3. pipeline-ci

Resource definitions for setting up the tekton delivery pipeline. The toolchain i.e. the main module itself creates **`ibm_toolchain_tool_pipeline`** Toolchain Integration. However, all the other resource required by the Delivery Pipeline itself are created within this module. These resources primarily includes
    1. Tekton Pipeline
    2. Tekton Pipeline Definitions ( DevSecOps Compliance )
    3. Tekton Pipeline Triggers

4. integrations

Toolchain Integrations required by the toolchain are created here. Currently, the toolchain creates following integrations. More integrations will be added soon.
    1. Key Protect
    2. Cloud Object Store
    3. Slack
    4. DevOps Insight
    5. Eclipse Orion Web IDE

5. service

Toolchain can leverage information about other IBM Cloud Services like IKS Cluster, ICR, COS and can lookup respective resources via terraform data sources which can then be used to setup up other integrations. 
    1. IBM Cloud IKS Cluster `ibm_container_cluster`
    2. IBM Cloud ICR `ibm_cr_namespaces`
    3. IBM Cloud Resource for Key Protect `ibm_resource_instance`

6. main

The main module is where all the other modules are instantiated. The current dependencies between various module and also on the main module is depicted below.

    1. repositories - Independent
    2. services - Independent
    3. integrations - repositories, services
    4. pipeline-ci - repositories, services, integrations
    5. pipeline-pr - repositories, services, integrations


#### Setup and Run the template

Please refer to the documentation [here](https://ibm.ent.box.com/file/937574387078)
to setup the provider and go-runtime required for creating the toolchain via terraform.

1. Export the below set of environment variable within your console

```
export IBMCLOUD_IS_NG_API_ENDPOINT=us-south-stage01.iaasdev.cloud.ibm.com

export IBMCLOUD_IAM_API_ENDPOINT=https://iam.test.cloud.ibm.com

export IBMCLOUD_RESOURCE_MANAGEMENT_API_ENDPOINT=https://resource-controller.test.cloud.ibm.com

export IBMCLOUD_RESOURCE_CONTROLLER_API_ENDPOINT=https://resource-controller.test.cloud.ibm.com

export IBMCLOUD_TOOLCHAIN_ENDPOINT=https://otc-api.us-south.devops.dev.cloud.ibm.com

export IBMCLOUD_TEKTON_PIPELINE_ENDPOINT=https://devops-api.us-south.devops.test.cloud.ibm.com/v2 

export IBMCLOUD_RESOURCE_CATALOG_API_ENDPOINT=https://globalcatalog.test.cloud.ibm.com
```

2. Rename the **`variables.tfvar.example`** to **`variables.tfvar`**.

3. Provide appropriate values for the variables in the **`variables.tfvar`** to point to various resources within your account.


| Variable      | Description | 
| ---           | ----        | 
| resource_group            | Resource Group for the toolchain     |
| region                    | IBM Cloud Region for the toolchain |
| toolchain_name            | Name for the toolchain      |
| toolchain_description     | Description for the toolchain |
| app_name                  | Name of the application       |
| app_image_name            | Name of the docker image for the application     |
| ibm_cloud_api_key         | Resource Group for the toolchain     |
| ibm_cloud_api             | IBM Cloud API Endpoint     |
|: Variable for Repositories : |
| app_repo                  | Git Repository and Issue Tracking (GRIT) repository hosting sample nodejs application |
| app_repo_type             | hostedgit, github     |
| pipeline_repo             | Git Repository and Issue Tracking (GRIT) repository hosting DevSecOps Compliance Pipeline Definition |
| pipeline_repo_type        | hostedgit, github     |
| evidence_repo             | Git Repository and Issue Tracking (GRIT) repository hosting template for Evidence Locker |
| evidence_repo_type        | hostedgit, github     |
| inventory_repo            | Git Repository and Issue Tracking (GRIT) repository hosting template for Inventory |
| inventory_repo_type       | hostedgit, github     |
| issues_repo               | Git Repository and Issue Tracking (GRIT) repository hosting template for Incident/Issues |
| issues_repo_type          | hostedgit, github     |
|:    Variables for Services    :|
| cluster_name              | IBM Cloud IKS Cluster name where the sample application is to be deployed by the toolchain    |
| cluster_namespace         | Namespace within the IBM Cloud IKS Cluster where the sample application is to be deployed  |
| cluster_region            | IBM Cloud IKS Cluster region |
| registry_namespace        | IBM Cloud ICR Namespace where the docker image built for the application is to be pushed |
| kp_name                   | Name of the Key Protect Instance within your account from where secrets are to be referred  |


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
- Finding ibm-cloud/ibm versions matching "1.37.1"...
- Installing ibm-cloud/ibm v1.37.1...
- Installed ibm-cloud/ibm v1.37.1 (self-signed, key ID AAD3B791C49CC253)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/cli/plugins/signing.html

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

╷
│ Warning: Provider development overrides are in effect
│ 
│ The following provider development overrides are set in the CLI configuration:
│  - ibm-cloud/ibm in /Users/piyush/go/bin
│ 
│ Skip terraform init when using provider development overrides. It is not necessary and may error unexpectedly.
╵

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```
5. Create the toolchain with variable overrides present in **`variables.tfvar`** file
```
 terraform apply -var-file=./variables.tfvar 
```
