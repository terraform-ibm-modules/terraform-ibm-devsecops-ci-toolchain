variable "toolchain_resource_group" {
  type        = string
  description = "The resource group within which the toolchain is created."
  default     = "Default"
}

variable "ibmcloud_api_key" {
  type        = string
  description = "API key used to create the toolchains."
  sensitive   = true
}

variable "ibmcloud_api" {
  type        = string
  description = "IBM Cloud API Endpoint."
  default     = "https://cloud.ibm.com"
}

variable "toolchain_region" {
  type        = string
  description = "IBM Cloud Region for the toolchain."
  default     = "us-south"
}

variable "toolchain_name" {
  type        = string
  description = "Name of the CI Toolchain."
  default     = "DevSecOps CI Toolchain - Terraform"
}

variable "toolchain_description" {
  type        = string
  description = "Description for the CI Toolchain."
  default     = "Toolchain created with Terraform template for DevSecOps CI Best Practices."
}

variable "app_name" {
  type        = string
  description = "Name of the application image and inventory entry."
  default     = "hello-compliance-app"
}

variable "pipeline_ibmcloud_api_key_secret_name" {
  type        = string
  description = "Name of the Cloud API key secret in the secret provider."
  default     = "ibmcloud-api-key"
}

variable "signing_key_secret_name" {
  type        = string
  description = "Name of the signing key secret in the secret provider."
  default     = "signing_key"
}

variable "cos_api_key_secret_name" {
  type        = string
  description = "Name of the COS API key secret in the secret provider."
  default     = "cos-api-key"
}

variable "slack_webhook_secret_name" {
  type        = string
  description = "Name of the webhook secret in the secret provider."
  default     = "slack-webhook"
}

variable "pipeline_dockerconfigjson_secret_name" {
  type        = string
  description = "Name of the dockerconfigjson secret in the secret provider."
  default     = "pipeline-dockerconfigjson"
}

variable "enable_pipeline_dockerconfigjson" {
  type        = bool
  description = "Enable to add the pipeline-dockerconfigjson to the pipeline properties"
  default     = false
}

variable "cluster_name" {
  type        = string
  description = "Name of the Kubernetes cluster where the application will be deployed."
  default     = "mycluster-free"
}

variable "cluster_namespace" {
  type        = string
  description = "Namespace of the Kubernetes cluster where the application will be deployed."
  default     = "default"
}

variable "dev_region" {
  type        = string
  description = "Region of the Kubernetes cluster where the application will be deployed."
  default     = "ibm:yp:us-south"
}

variable "dev_resource_group" {
  type        = string
  description = "The cluster resource group."
  default     = "Default"
}

variable "registry_namespace" {
  type        = string
  description = "A unique namespace within the IBM Cloud Container Registry region where the application image is stored."
  default     = "devsecops-ci-registry"
}

variable "registry_region" {
  type        = string
  description = "IBM Cloud Region where the IBM Cloud Container Registry namespace is created."
  default     = "ibm:yp:us-south"
}

variable "authorization_policy_creation" {
  type        = string
  description = "Disable Toolchain Service to Secrets Manager Service authorization policy creation."
  default     = ""
}

variable "app_repo_template_url" {
  type        = string
  description = "Url of app repo template to be cloned"
  default     = ""
}
variable "app_repo_clone_from_url" {
  type        = string
  description = "Override the default sample app by providing your own sample app URL, which will be cloned into the app repo. Note, using clone_if_not_exists mode, so if the app repo already exists the repo contents are unchanged."
  default     = ""
}

variable "app_repo_clone_from_branch" {
  type        = string
  description = "Used when app_repo_clone_from_url is provided, the default branch that will be used by the CI build, usually either main or master."
  default     = ""
}

variable "app_repo_existing_url" {
  type        = string
  description = "Override to bring your own existing application repository URL, which will be used directly instead of cloning the default sample."
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
  description = "Custom server GUID, or other options for 'git_id' field in the browser UI."
  default     = ""
}

variable "app_repo_clone_to_git_provider" {
  type        = string
  description = "By default 'hostedgit', else use 'githubconsolidated' or 'gitlab'."
  default     = ""
}

variable "app_repo_clone_to_git_id" {
  type        = string
  description = "Custom server GUID, or other options for 'git_id' field in the browser UI."
  default     = ""
}

variable "app_repo_name" {
  type        = string
  description = "The repository name."
  default     = ""
}

variable "app_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "app_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = false
}

variable "app_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "app_repo_initilization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "pipeline_config_repo_existing_url" {
  type        = string
  description = "Specify a repository containing a custom pipeline-config.yaml file"
  default     = ""
}

variable "pipeline_config_repo_branch" {
  type        = string
  description = "Specify the branch containing the custom pipeline-config.yaml file."
  default     = ""
}

variable "pipeline_config_repo_clone_from_url" {
  type        = string
  description = "Specify a repository containing a custom pipeline-config.yaml file"
  default     = ""
}

variable "pipeline_config_path" {
  type        = string
  description = "The name and path of the pipeline-config.yaml file within the pipeline-config/app repo"
  default     = ".pipeline-config.yaml"
}

variable "pipeline_config_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "pipeline_config_initilization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "app_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "compliance_pipeline_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "issues_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "evidence_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = "oauth"
}

variable "inventory_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
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
  default     = "compliance"
}


variable "default_git_provider" {
  type        = string
  default     = "hostedgit"
  description = "Choose the default git provider for app repo"
  validation {
    condition     = contains(["hostedgit", "githubconsolidated", "gitlab"], var.default_git_provider)
    error_message = "Must be either \"hostedgit\" or \"gitlab\" or \"githubconsolidated\"."
  }
}

variable "pipeline_config_repo_git_provider" {
  type        = string
  default     = "hostedgit"
  description = "Git provider for pipeline repo config"
  validation {
    condition     = contains(["hostedgit", "githubconsolidated", "gitlab"], var.pipeline_config_repo_git_provider)
    error_message = "Must be either \"hostedgit\" or \"gitlab\" or \"githubconsolidated\" for pipeline config repo."
  }
}

variable "compliance_pipeline_repo_git_provider" {
  type        = string
  default     = "hostedgit"
  description = "Git provider for pipeline repo"
  validation {
    condition     = contains(["hostedgit", "githubconsolidated", "gitlab"], var.compliance_pipeline_repo_git_provider)
    error_message = "Must be either \"hostedgit\" or \"gitlab\" or \"githubconsolidated\" for pipeline repo."
  }
}

variable "inventory_repo_git_provider" {
  type        = string
  default     = "hostedgit"
  description = "Git provider for inventory repo"
  validation {
    condition     = contains(["hostedgit", "githubconsolidated", "gitlab"], var.inventory_repo_git_provider)
    error_message = "Must be either \"hostedgit\" or \"gitlab\" or \"githubconsolidated\" for Inventory repo."
  }
}

variable "evidence_repo_git_provider" {
  type        = string
  default     = "hostedgit"
  description = "Git provider for evidence repo"
  validation {
    condition     = contains(["hostedgit", "githubconsolidated", "gitlab"], var.evidence_repo_git_provider)
    error_message = "Must be either \"hostedgit\" or \"gitlab\" or \"githubconsolidated\" for evidence repo."
  }
}

variable "issues_repo_git_provider" {
  type        = string
  default     = "hostedgit"
  description = "Git provider for issue repo "
  validation {
    condition     = contains(["hostedgit", "githubconsolidated", "gitlab"], var.issues_repo_git_provider)
    error_message = "Must be either \"hostedgit\" or \"gitlab\" or \"githubconsolidated\" for issue repo."
  }
}

variable "issues_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "evidence_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "inventory_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "issues_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = true
}

variable "issues_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
  default     = ""
}

variable "issues_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "issues_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "issues_repo_initilization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "issues_repo_name" {
  type        = string
  description = "The repository name."
  default     = ""
}

variable "issues_repo_existing_url" {
  type        = string
  description = "The repo URL that integration will link with."
  default     = ""

}

variable "issues_repo_clone_from_url" {
  type        = string
  description = "The repo URL that the intgeration will clone from."
  default     = ""
}

variable "inventory_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = false
}

variable "inventory_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
  default     = ""
}

variable "inventory_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "inventory_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "inventory_repo_initilization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "inventory_repo_name" {
  type        = string
  description = "The repository name."
  default     = ""
}

variable "inventory_repo_existing_url" {
  type        = string
  description = "The repo URL that integration will link with."
  default     = ""

}

variable "inventory_repo_clone_from_url" {
  type        = string
  description = "The repo URL that the intgeration will clone from."
  default     = ""
}

variable "evidence_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = false
}

variable "evidence_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
  default     = ""
}

variable "evidence_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "evidence_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "evidence_repo_initilization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "evidence_repo_name" {
  type        = string
  description = "The repository name."
  default     = ""
}

variable "evidence_repo_existing_url" {
  type        = string
  description = "The repo URL that integration will link with."
  default     = ""

}

variable "evidence_repo_clone_from_url" {
  type        = string
  description = "The repo URL that the intgeration will clone from."
  default     = ""
}

variable "compliance_pipeline_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "compliance_pipelines_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
  default     = ""
}

variable "compliance_pipeline_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = false
}

variable "pipeline_config_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "pipeline_config_repo_issues_enabled" {
  type        = bool
  description = "Set to `true` to enable issues."
  default     = false
}

variable "pipeline_config_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "pipeline_config_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}


variable "pipeline_config_repo_name" {
  type        = string
  description = "The repository name."
  default     = ""
}

variable "pipeline_config_repo_git_id" {
  type        = string
  description = "Set this value to `github` for github.com, or to the GUID of a custom GitHub Enterprise server."
  default     = ""
}

variable "app_repo_integration_owner" {
  type        = string
  description = "The name of the integration owner."
  default     = ""
}

variable "compliance_pipeline_repo_url" {
  type        = string
  default     = ""
  description = "Url of pipeline repo template to be cloned"
}

variable "inventory_source_repo_url" {
  type        = string
  default     = ""
  description = "Url of inventory repo template to be cloned"
}

variable "evidence_source_repo_url" {
  type        = string
  default     = ""
  description = "Url of evidence repo template to be cloned"
}

variable "issues_source_repo_url" {
  type        = string
  default     = ""
  description = "Url of issue repo template to be cloned"
}

variable "enable_slack" {
  type        = bool
  description = "Set to true to create the integration"
  default     = false
}

variable "slack_channel_name" {
  type        = string
  description = "The Slack channel that notifications are posted to."
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

variable "cos_endpoint" {
  type        = string
  description = "COS endpoint name"
  default     = ""
}

variable "cos_bucket_name" {
  type        = string
  description = "COS bucket name"
  default     = ""
}

variable "sm_secret_group" {
  type        = string
  description = "Group in Secrets Manager for organizing/grouping secrets."
  default     = "Default"
}

variable "sm_resource_group" {
  type        = string
  description = "The resource group containing the Secrets Manager instance."
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
  description = "The resource group containing the Key Protect instance."
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
  description = "Set to enable Key Protect Integration."
  default     = false
}

variable "enable_secrets_manager" {
  type        = bool
  description = "Set to enable Secrets Manager Integration."
  default     = true
}

variable "sm_integration_name" {
  type        = string
  description = "The name of the Secrets Manager integration."
  default     = "sm-compliance-secrets"
}

variable "kp_integration_name" {
  type        = string
  description = "The name of the Key Protect integration."
  default     = "kp-compliance-secrets"
}

variable "slack_integration_name" {
  type        = string
  description = "The name of the Slack integration."
  default     = "slack-compliance"
}
######## Deployment Strategy ##################

variable "deployment_target" {
  type        = string
  description = "The deployment target, 'cluster' or 'code-engine'."
  default     = "cluster"
}

######## Code Engine Vars #####################

variable "code_engine_project" {
  type        = string
  description = "The name of the Code Engine project to use (or create)."
  default     = "DevSecOps_CE"
}

variable "code_engine_region" {
  type        = string
  description = "The region to create/lookup for the Code Engine project."
  default     = "ibm:yp:us-south"
}

variable "code_engine_resource_group" {
  type        = string
  description = "The resource group of the Code Engine project."
  default     = "Default"
}

variable "code_engine_entity_type" {
  type        = string
  description = "Type of Code Engine entity to create/update as part of deployment. Default type is 'application'. Set as 'job' for 'job' type."
  default     = ""
}

variable "code_engine_build_strategy" {
  type        = string
  description = "The build strategy for the Code Engine entity. Default strategy is 'dockerfile'. Set as 'buildpacks' for 'buildpacks' build."
  default     = ""
}

variable "code_engine_source" {
  type        = string
  description = "The path to the location of code to build in the repository."
  default     = ""
}

variable "compliance_base_image" {
  type        = string
  description = "Pipeline baseimage to run most of the built-in pipeline code."
  default     = ""
}
variable "app_group" {
  type        = string
  description = "Specify Git user/group for your application."
  default     = ""
}

variable "pipeline_config_group" {
  type        = string
  description = "Specify Git user/group for your config repo."
  default     = ""
}

variable "ci_pipeline_branch" {
  type        = string
  description = "The branch within ci pipeline definitions repository for Compliance CI Toolchain."
  default     = "open-v9"
}

variable "pr_pipeline_branch" {
  type        = string
  description = "The branch within pr pipeline definitions repository for Compliance CI Toolchain."
  default     = "open-v9"
}
variable "compliance_pipeline_group" {
  type        = string
  description = "Specify Git user/group for your compliance pipeline repo."
  default     = ""
}

variable "issues_group" {
  type        = string
  description = "Specify Git user/group for issues repository."
  default     = ""
}

variable "inventory_group" {
  type        = string
  description = "Specify Git user/group for inventory repository."
  default     = ""
}

variable "evidence_group" {
  type        = string
  description = "Specify Git user/group for evidence repository."
  default     = ""
}

variable "link_to_doi_toolchain" {
  description = "Enable a link to a DevOps Insights instance in another toolchain, true or false."
  type        = bool
  default     = false
}

variable "doi_toolchain_id" {
  type        = string
  description = "DevOps Insights Toolchain ID to link to."
  default     = ""
}

variable "pipeline_debug" {
  type        = string
  description = "Set to '1' to enable debug logging"
  default     = "0"
}

variable "opt_in_dynamic_api_scan" {
  type        = string
  description = "To enable the OWASP Zap API scan. '1' enable or '0' disable."
  default     = "1"
}

variable "opt_in_dynamic_ui_scan" {
  type        = string
  description = "To enable the OWASP Zap UI scan. '1' enable or '0' disable."
  default     = "1"
}

variable "opt_in_dynamic_scan" {
  type        = string
  description = "To enable the OWASP Zap scan. '1' enable or '0' disable."
  default     = "1"
}

variable "opt_out_v1_evidence" {
  type        = string
  description = "Opt out of evidence v1."
  default     = "1"
}

variable "opt_in_sonar" {
  type        = string
  description = "Opt in for Sonarqube."
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
  description = "If set to 1, CRA also generates the BOM in cyclonedx format."
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
  description = "Runs a SonarQube scan in an isolated Docker-in-Docker container (default configuration) or in an existing Kubernetes cluster (custom configuration). Options: default or custom."
  default     = "default"
}

variable "slack_notifications" {
  type        = string
  description = "The switch that turns the Slack integration on or off."
  default     = "0"
}

variable "enable_artifactory" {
  type        = bool
  default     = false
  description = "Set true to enable artifacory for devsecops."
}

variable "enable_privateworker" {
  type        = bool
  default     = false
  description = "Set true to enable private worker  for devsecops."
}

variable "artifactory_token_secret_name" {
  type        = string
  default     = "artifactory-token"
  description = "Name of the artifactory token secret in the secret provider."
}

variable "artifactory_user" {
  type        = string
  description = "Type the User ID or email for your Artifactory repository."
  default     = ""
}

variable "artifactory_dashboard_url" {
  type        = string
  default     = ""
  description = "Type the URL that you want to navigate to when you click the Artifactory integration tile."
}
variable "artifactory_repo_url" {
  type        = string
  default     = ""
  description = "Type the URL for your Artifactory release repository."
}

variable "artifactory_repo_name" {
  type        = string
  default     = "wcp-compliance-automation-team-docker-local"
  description = "Type the name of your Artifactory repository where your docker images are located."
}

variable "artifactory_integration_name" {
  type        = string
  default     = "artifactory-dockerconfigjson"
  description = "The name of the Artifactory tool integration"
}

variable "privateworker_credentials_secret_name" {
  type        = string
  default     = "private-worker-service-api"
  description = "Name of the privateworker secret in the secret provider."
}

variable "privateworker_name" {
  type        = string
  description = "The name of the private worker integration."
  default     = "private-worker-tool-01"
}

variable "enable_devops_signing_var" {
  type        = string
  description = "Set to `true` to show the `signing-key` pipeline variable"
  default     = true
}


####### Trigger properties ###################
variable "trigger_git_name" {
  type        = string
  description = "The name of the CI pipeline GIT trigger."
  default     = "Git CI Trigger"
}
variable "trigger_git_enable" {
  type        = bool
  description = "Set to `true` to enable the CI pipeline Git trigger."
  default     = true
}

variable "trigger_timed_name" {
  type        = string
  description = "The name of the CI pipeline Timed trigger."
  default     = "Git CI Timed Trigger"
}
variable "trigger_timed_enable" {
  type        = bool
  description = "Set to `true` to enable the CI pipeline Timed trigger."
  default     = false
}
variable "trigger_timed_cron_schedule" {
  type        = string
  description = "Only needed for timer triggers. Cron expression that indicates when this trigger will activate. Maximum frequency is every 5 minutes. The string is based on UNIX crontab syntax: minute, hour, day of month, month, day of week. Example: 0 *_/2 * * * - every 2 hours."
  default     = "0 4 * * *"
}

variable "trigger_manual_name" {
  type        = string
  description = "The name of the CI pipeline Manual trigger."
  default     = "Manual Trigger"
}
variable "trigger_manual_enable" {
  type        = bool
  description = "Set to `true` to enable the CI pipeline Manual trigger."
  default     = true
}

variable "trigger_pr_git_name" {
  type        = string
  description = "The name of the PR pipeline GIT trigger."
  default     = "Git PR Trigger"
}
variable "trigger_pr_git_enable" {
  type        = bool
  description = "Set to `true` to enable the PR pipeline Git trigger."
  default     = true
}
