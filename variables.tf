variable "toolchain_resource_group" {
  type        = string
  description = "Resource group within which toolchain will be created"
  default     = "Default"
}

variable "ibm_cloud_api_key" {
  type        = string
  description = "IBM Cloud API KEY to fetch/post cloud resources in terraform. Not used in the pipeline, where a secret reference is used instead."
  sensitive   = true
}

variable "ibm_cloud_api" {
  type        = string
  description = "IBM Cloud API Endpoint"
  default     = "https://cloud.ibm.com"
}

variable "toolchain_region" {
  type        = string
  description = "IBM Cloud region where your toolchain will be created"
  default     = "us-south"
}

variable "toolchain_name" {
  type        = string
  description = "Name of the Toolchain."
  default     = "DevSecOps CI Toolchain - Terraform"
}

variable "toolchain_description" {
  type        = string
  description = "Description for the Toolchain."
  default     = "Toolchain created with terraform template for DevSecOps CI Best Practices"
}

variable "app_name" {
  type        = string
  description = "Name of the application image and inventory entry."
  default     = "hello-compliance-app"
}

variable "pipeline_ibmcloud_api_key_secret_name" {
  type        = string
  description = "Name of the Cloud api key secret in the secret provider."
  default     = "ibmcloud-api-key"
}

variable "signing_key_secret_name" {
  type        = string
  description = "Name of the signing key secret in the secret provider."
  default     = "signing_key"
}

variable "cos_api_key_secret_name" {
  type        = string
  description = "Name of the cos api key secret in the secret provider."
  default     = "cos-api-key"
}

variable "slack_webhook_secret_name" {
  type        = string
  description = "Name of the webhook secret in the secret provider."
  default     = "slack-webhook"
}

variable "cluster_name" {
  type        = string
  description = "Name of the kubernetes cluster where the application will be deployed."
  default     = "mycluster-free"
}

variable "cluster_namespace" {
  type        = string
  description = "Name of the kubernetes cluster where the application will be deployed."
  default     = "devsecops-ci-ns"
}

variable "dev_region" {
  type        = string
  description = "Region of the kubernetes cluster where the application will be deployed."
  default     = "ibm:yp:us-south"
}

variable "dev_resource_group" {
  type        = string
  description = "The cluster resource group."
  default     = "Default"
}

variable "registry_namespace" {
  type        = string
  description = "Namespace within the IBM Cloud Container Registry where application image need to be stored."
  default     = "devsecops-ci-registry"
}

variable "registry_region" {
  type        = string
  description = "IBM Cloud Region where the IBM Cloud Container Registry namespace is to be created."
  default     = "ibm:yp:us-south"
}

variable "authorization_policy_creation" {
  type        = string
  description = "Disable Toolchain Service to Secrets Manager Service auhorization policy creation."
  default     = ""
}

variable "app_repo_clone_from_url" {
    type        = string
    description = "(Optional) Override the default sample app by providing your own sample app url, which will be cloned into the app repo. Note, using clone_if_not_exists mode, so if the app repo already exists the repo contents are unchanged."
    default     = ""
}

variable "app_repo_clone_from_branch" {
    type        = string
    description = "Used when app_repo_clone_from_url is provided, the default branch that will be used by the CI build, usually either main or master."
    default     = ""
}

variable "app_repo_existing_url" {
    type        = string
    description = "(Optional) Override to bring your own existing application repository URL, which will be used directly instead of cloning the default sample."
    default     = ""
}

variable "app_repo_existing_branch" {
    type        = string
    description = "Used when app_repo_existing_url is provided, the default branch that will be used by the CI build, usually either main or master."
    default     = ""
}

variable "app_repo_existing_git_provider" {
  type        = string
  description = "By default 'hostedgit', else use 'githubconsolidated' or 'gitlab'."
  default     = ""
}

variable "app_repo_existing_git_id" {
  type        = string
  description = "By default absent, else custom server GUID, or other options for 'git_id' field in the browser UI."
  default     = ""
}

variable "app_repo_clone_to_git_provider" {
  type        = string
  description = "By default 'hostedgit', else use 'githubconsolidated' or 'gitlab'."
  default     = ""
}

variable "app_repo_clone_to_git_id" {
  type        = string
  description = "By default absent, else custom server GUID, or other options for 'git_id' field in the browser UI."
  default     = ""
}

variable "pipeline_config_repo_existing_url" {
  type        = string
  description = "(Optional). Specify a repository containing a custom pipeline-config.yaml file"
  default     = ""
}

variable "pipeline_config_repo_branch" {
  type        = string
  description = "(Optional). Specify the branch containing the custom pipeline-config.yaml file"
  default     = ""
}

variable "pipeline_config_repo_clone_from_url" {
  type        = string
  description = "(Optional). Specify a repository to clone that contains a custom pipeline-config.yaml file"
  default     = ""
}

variable "pipeline_config_path" {
  type        = string
  description = "The name and path of the pipeline-config.yaml file within the pipeline-config repo"
  default     = ".pipeline-config.yaml"
}

variable "pipeline_config_repo_auth_type" {
  type        = string
  description = "(Optional) Default 'oauth': Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "app_repo_auth_type" {
  type        = string
  description = "(Optional) Default 'oauth': Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "compliance_pipeline_repo_auth_type" {
  type        = string
  description = "(Optional) Default 'oauth': Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "issues_repo_auth_type" {
  type        = string
  description = "(Optional) Default 'oauth': Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "evidence_repo_auth_type" {
  type        = string
  description = "(Optional) Default 'oauth': Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "inventory_repo_auth_type" {
  type        = string
  description = "(Optional) Default 'oauth': Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "app_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "pipeline_config_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "inventory_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "issues_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "evidence_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "compliance_pipeline_repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider."
  default     = "git-token"
}

variable "repositories_prefix" { 
  type        = string
  description = "Prefix name for the cloned compliance repos."
  default     = "compliance-tf"   
}

variable "enable_slack" {
  type        = bool
  description  = "Default: false. Set to true to create the integration"
  default     = false
}

variable "slack_channel_name" {
  type        = string
  description = "The Slack channel that notifications will be posted to."
  default     = "my-channel"
}

variable "slack_team_name" {
  type        = string
  description = "The Slack team name, which is the word or phrase before .slack.com in the team URL."
  default     = "my-team"
}

variable "slack_pipeline_fail" {
  type        = bool
  description = "Generate pipeline failed notifications."
  default     = true
}

variable "slack_pipeline_start" {
  type        = bool
  description = "Generate pipeline start notifications."
  default     = true
}

variable "slack_pipeline_success" {
  type        = bool
  description = "Generate pipeline succeeded notifications."
  default     = true
}

variable "slack_toolchain_bind" {
  type        = bool
  description = "Generate tool added to toolchain notifications."
  default     = true
}

variable "slack_toolchain_unbind" {
  type        = bool
  description = "Generate tool removed from toolchain notifications."
  default     = true
}

# variable "cos_api_key_secret_name" {
#   type        = string
#   description = "cos api key"
#   default     = ""
# }

variable "cos_endpoint" {
  type        = string
  description = "cos endpoint name"
  default     = ""
}

variable "cos_bucket_name" {
  type        = string
  description = "cos bucket name"
  default     = ""
}

variable "sm_secret_group" {
  type        = string
  description = "The Secrets Manager secret group containing your secrets."
  default     = "Default"
}

variable "sm_resource_group" {
  type        = string
  description = "The resource group containing the Secrets Manager instance for your secrets."
  default     = "Default"
}

variable "sm_name" {
  type        = string
  description = "Name of the Secrets Manager instance where the secrets are stored."
  default     = "sm-compliance-secrets"
}

variable "sm_location" {
  type        = string
  description = "IBM Cloud location/region containing the Secrets Manager instance."
  default     = "us-south"
}

variable "kp_resource_group" {
  type        = string
  description = "The resource group containing the Key Protect instance for your secrets."
  default     = "Default"
}

variable "kp_name" {
  type        = string
  description = "Name of the Key Protect instance where the secrets are stored."
  default     = "kp-compliance-secrets"
}

variable "kp_location" {
  type        = string
  description = "IBM Cloud location/region containing the Key Protect instance."
  default     = "us-south"
}

variable "enable_key_protect" {
  type        = bool
  default     = false
}

variable "enable_secrets_manager" {
  type        = bool
  default     = true
}
######## Deployment Strategy ##################

variable "deployment_target" {
  type        = string
  description = "The deployment target, cluster or code-engine"
  default     = "cluster"
}

######## Code Engine Vars #####################

variable "code_engine_project" {
  type        = string
  description = "The name of the Code Engine project to use (or create)"
  default     = "DevSecOps_CE"
}

variable "code_engine_region" {
  type        = string
  description = "The region to create/lookup for the Code Engine project"
  default     = "ibm:yp:us-south"
}

variable "code_engine_resource_group" {
  type        = string
  description = "The resource group of the Code Engine project"
  default     = "Default"
}

variable "code_engine_entity_type" {
  type        = string
  description = "Type of Code Engine entity to create/update as part of deployment. Default type is 'application'. Set as 'job' for 'job' type"
  default     = ""
}

variable "code_engine_build_strategy" {
  type        = string
  description = "The build strategy for the Code Engine entity. Default strategy is 'dockerfile'. Set as 'buildpacks' for 'buildpacks' build"
  default     = ""
}

variable "code_engine_source" {
  type        = string
  description = "The path to the location of code to build in the repository"
  default     = ""
}

variable "compliance_base_image" {
  type        = string
  description = "Pipeline baseimage to run most of the built-in pipeline code"
  default     = ""
}
variable "app_group" {
  type        = string
  description = "Specify gitlab group for your application"
  default     = ""
}

variable "pipeline_config_group" {
  type        = string
  description = "Specify GitLab group for your config repo"
  default     = "" 
}

variable "compliance_pipeline_group" {
  type        = string
  description = "Specify GitLab group for your compliance pipeline repo"
  default     = "" 
}

variable "issues_group" {
  type        = string
  description = "Specify gitlab group for issues repository"
  default     = ""
}

variable "inventory_group" {
  type        = string
  description = "Specify gitlab group for inventory repository"
  default     = ""
}

variable "evidence_group" {
  type        = string
  description = "Specify gitlab group for evidence repository"
  default     = ""
}

variable "link_to_doi_toolchain" {
  description = "Enable a link to a DevOpsInsights instance in another toolchain, true or false"
  type        = bool
  default     = false
}

variable "doi_toolchain_id" {
  type = string
  description = "DevOpsInsights Toolchain ID to link to"
  default = ""  
}

variable "pipeline_debug" {
  type        = string
  description = "'0' by default. Set to '1' to enable debug logging"
  default = "0"
}

variable "opt_in_dynamic_api_scan" {
  type        = string
  description = "To enable the OWASP Zap API scan. '1' enable or '0' disable"
  default     = "1"
}

variable "opt_in_dynamic_ui_scan" {
  type        = string
  description = "To enable the OWASP Zap UI scan. '1' enable or '0' disable"
  default     = "1"
}

variable "opt_in_dynamic_scan" {
  type        = string
  description = "To enable the OWASP Zap scan. '1' enable or '0' disable"
  default     = "1"
}

variable "opt_out_v1_evidence" {
  type        = string
  description = ""
  default     = "1"
}

variable "opt_in_sonar" {
  type        = string
  description = ""
  default     = "1"
}

variable "doi_environment" {
  type        = string
  description = "The DevOps Insights target environment."
  default     = ""
}

variable "doi_toolchain_id_pipeline_property" {
  type        = string
  description = "The DevOps Insights instance toolchain ID."
  default     = ""
}

variable "cra_generate_cyclonedx_format" {
  type        = string
  description = "If set to 1, CRA also generates the BOM in cyclonedx format (defaults to 0)."
  default     = "1"
}

variable "custom_image_tag" {
  type        = string
  description = "The custom tag for the image in a comma-separated list."
  default     = ""
}

variable "app_version" {
  type        = string
  description = "The version of the app to deploy."
  default     = "v1"
}

variable "sonarqube_config" {
  type        = string
  description = "Runs a SonarQube scan in an isolated Docker-in-Docker container (default configuration) or in an existing Kubernetes cluster (custom configuration). Options: default or custom. Default is default."
  default     = "default"
}

variable "slack_notifications" {
    type       = string
    description = "The switch that turns the Slack integration on or off"
    default    = "0"
}