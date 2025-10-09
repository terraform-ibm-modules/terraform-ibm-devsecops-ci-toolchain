variable "toolchain_resource_group" {
  type        = string
  description = "The resource group within which the toolchain is created."
  default     = "Default"
}

variable "ibmcloud_api_key" {
  type        = string
  description = "API key used to create the toolchain."
  sensitive   = true
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

variable "toolchain_resource_region_override" {
  type        = string
  description = "IBM Cloud region for the created resources. If not set resources will be created in the region set in `toolchain_region`."
  default     = ""
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

variable "cos_api_key_secret_name" {
  type        = string
  description = "Name of the COS API key secret in the secret provider."
  default     = ""
}

variable "slack_webhook_secret_name" {
  type        = string
  description = "Name of the webhook secret in the secret provider."
  default     = "slack-webhook"
}

variable "pipeline_ibmcloud_api_key_secret_group" {
  type        = string
  description = "Secret group prefix for the pipeline ibmcloud API key secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "cos_api_key_secret_group" {
  type        = string
  description = "Secret group prefix for the COS API key secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "slack_webhook_secret_group" {
  type        = string
  description = "Secret group prefix for the Slack webhook secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "pipeline_doi_api_key_secret_group" {
  type        = string
  description = "Secret group prefix for the pipeline DOI api key. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "sonarqube_secret_group" {
  type        = string
  description = "Secret group prefix for the SonarQube secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
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
  default     = ""
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

variable "app_repo_clone_from_url" {
  type        = string
  description = "Override the default sample app by providing your own sample app URL, which will be cloned into the app repo. Note, using clone_if_not_exists mode, so if the app repo already exists the repo contents are unchanged."
  default     = ""
}

variable "app_repo_branch" {
  type        = string
  description = "Used when app_repo_clone_from_url is provided, the default branch that will be used by the CI build, usually either main or master."
  default     = ""
}

variable "app_repo_existing_url" {
  type        = string
  description = "Override to bring your own existing application repository URL, which will be used directly instead of cloning the default sample."
  default     = ""
}

variable "app_repo_existing_git_provider" {
  type        = string
  description = "This will be inferred based on the repo url. Either 'hostedgit', 'githubconsolidated' or 'gitlab'. Can explicitly be provided."
  default     = ""
}

variable "app_repo_existing_git_id" {
  type        = string
  description = "This will be inferred based on the repo url. Custom server GUID, or other options for 'git_id' field in the browser UI."
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

variable "app_repo_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "app_repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "app_repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "app_repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
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

variable "pipeline_config_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = ""
}

variable "pipeline_config_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "app_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = ""
}

variable "compliance_pipeline_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = ""
}

variable "issues_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = ""
}

variable "evidence_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = ""
}

variable "inventory_repo_auth_type" {
  type        = string
  description = "Select the method of authentication that will be used to access the git provider. 'oauth' or 'pat'"
  default     = ""
}

# SECRET REF NAMES
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

# SECRET CRNs

variable "app_repo_git_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the app repository Git Token."
  default     = ""
  validation {
    condition     = startswith(var.app_repo_git_token_secret_crn, "crn:") || var.app_repo_git_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "issues_repo_git_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Issues repository Git Token."
  default     = ""
  validation {
    condition     = startswith(var.issues_repo_git_token_secret_crn, "crn:") || var.issues_repo_git_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "evidence_repo_git_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Evidence repository Git Token."
  default     = ""
  validation {
    condition     = startswith(var.evidence_repo_git_token_secret_crn, "crn:") || var.evidence_repo_git_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "inventory_repo_git_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Inventory repository Git Token."
  default     = ""
  validation {
    condition     = startswith(var.inventory_repo_git_token_secret_crn, "crn:") || var.inventory_repo_git_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "compliance_pipeline_repo_git_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Compliance Pipeline repository Git Token."
  default     = ""
  validation {
    condition     = startswith(var.compliance_pipeline_repo_git_token_secret_crn, "crn:") || var.compliance_pipeline_repo_git_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "pipeline_config_repo_git_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Pipeline Config repository Git Token."
  default     = ""
  validation {
    condition     = startswith(var.pipeline_config_repo_git_token_secret_crn, "crn:") || var.pipeline_config_repo_git_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "cos_api_key_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Cloud Object Storage apikey."
  default     = ""
  validation {
    condition     = startswith(var.cos_api_key_secret_crn, "crn:") || var.cos_api_key_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "pipeline_ibmcloud_api_key_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the IBMCloud apikey."
  default     = ""
  validation {
    condition     = startswith(var.pipeline_ibmcloud_api_key_secret_crn, "crn:") || var.pipeline_ibmcloud_api_key_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "signing_key_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the signing key secret."
  default     = ""
  validation {
    condition     = startswith(var.signing_key_secret_crn, "crn:") || var.signing_key_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "slack_webhook_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Slack Webhook secret."
  default     = ""
  validation {
    condition     = startswith(var.slack_webhook_secret_crn, "crn:") || var.slack_webhook_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "privateworker_credentials_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Private Worker secret secret."
  default     = ""
  validation {
    condition     = startswith(var.privateworker_credentials_secret_crn, "crn:") || var.privateworker_credentials_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "artifactory_token_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the Artifactory secret."
  default     = ""
  validation {
    condition     = startswith(var.artifactory_token_secret_crn, "crn:") || var.artifactory_token_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "pipeline_doi_api_key_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the pipeline DOI apikey."
  default     = ""
  validation {
    condition     = startswith(var.pipeline_doi_api_key_secret_crn, "crn:") || var.pipeline_doi_api_key_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "sonarqube_secret_crn" {
  type        = string
  sensitive   = true
  description = "The CRN for the SonarQube secret."
  default     = ""
  validation {
    condition     = startswith(var.sonarqube_secret_crn, "crn:") || var.sonarqube_secret_crn == ""
    error_message = "Must be a CRN or left empty."
  }
}

variable "signing_key_secret_name" {
  type        = string
  description = "Name of the signing key secret in the secret provider."
  default     = ""
}

###########################
variable "app_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the App repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "issues_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Issues repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "inventory_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Inventory repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "evidence_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Evidence repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "compliance_pipeline_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Compliance Pipeline repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "pipeline_config_repo_secret_group" {
  type        = string
  description = "Secret group prefix for the Pipeline Config repo secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "privateworker_credentials_secret_group" {
  type        = string
  description = "Secret group prefix for the Private Worker secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "signing_key_secret_group" {
  type        = string
  description = "Secret group prefix for the signing secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
}

variable "artifactory_token_secret_group" {
  type        = string
  description = "Secret group prefix for the Artifactory token secret. Defaults to `sm_secret_group` if not set. Only used with `Secrets Manager`."
  default     = ""
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

variable "issues_repo_initialization_type" {
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

variable "issues_repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "issues_repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "issues_repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
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

variable "inventory_repo_initialization_type" {
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

variable "inventory_repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "inventory_repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "inventory_repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
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

variable "evidence_repo_initialization_type" {
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

variable "evidence_repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "evidence_repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "evidence_repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
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

variable "compliance_pipelines_repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "compliance_pipelines_repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "compliance_pipelines_repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
  default     = ""
}

variable "compliance_pipelines_repo_traceability_enabled" {
  type        = bool
  description = "Set to `true` to enable traceability."
  default     = false
}

variable "compliance_pipelines_repo_is_private_repo" {
  type        = bool
  description = "Set to `true` to make repository private."
  default     = true
}

variable "compliance_pipelines_repo_initialization_type" {
  type        = string
  description = "The initialization type for the repo. Can be `new`, `fork`, `clone`, `link`, `new_if_not_exists`, `clone_if_not_exists`, `fork_if_not_exists`."
  default     = ""
}

variable "compliance_pipelines_repo_name" {
  type        = string
  description = "The repository name."
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

variable "pipeline_config_repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "pipeline_config_repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "pipeline_config_repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
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

variable "compliance_pipeline_existing_repo_url" {
  type        = string
  default     = ""
  description = "The URL of an existing compliance pipelines repository."
}

variable "compliance_pipeline_source_repo_url" {
  type        = string
  default     = ""
  description = "The URL of a compliance pipelines repository to clone."
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

variable "enable_pipeline_notifications" {
  type        = bool
  description = "When enabled, pipeline run events will be sent to the Event Notifications and Slack integrations in the enclosing toolchain."
  default     = false
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

variable "cos_dashboard_url" {
  type        = string
  description = "The dashboard URL for the COS toolcard."
  default     = "https://cloud.ibm.com/objectstorage"
}

variable "cos_documentation_url" {
  type        = string
  description = "The documentation URL that appears on the tool card."
  default     = "https://cloud.ibm.com/objectstorage"
}

variable "cos_description" {
  type        = string
  description = "The COS description on the tool card."
  default     = "Cloud Object Storage to store evidences within DevSecOps Pipelines"
}

variable "cos_integration_name" {
  type        = string
  description = "The name of the COS integration."
  default     = "Evidence Store"
}

variable "sm_secret_group" {
  type        = string
  description = "Group in Secrets Manager for organizing/grouping secrets."
  default     = "Default"
}

variable "sm_resource_group" {
  type        = string
  description = "The resource group containing the Secrets Manager instance. Not required if using a Secrets Manager CRN instance."
  default     = "Default"
}

variable "sm_name" {
  type        = string
  description = "Name of the Secrets Manager instance where the secrets are stored. Not required if using a Secrets Manager CRN instance."
  default     = "sm-compliance-secrets"
}

variable "sm_location" {
  type        = string
  description = "IBM Cloud location/region containing the Secrets Manager instance. Not required if using a Secrets Manager CRN instance."
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

variable "sm_instance_crn" {
  type        = string
  description = "The CRN of the Secrets Manager instance."
  default     = ""
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

variable "enable_cos" {
  type        = bool
  description = "Set to `true` to enable the COS integration."
  default     = true
}

variable "enable_insights" {
  type        = bool
  description = "Set to `true` to enable the DevOps Insights integration."
  default     = true
}

######## DevSecOps Flavor ##################

variable "devsecops_flavor" {
  type        = string
  description = "The deployment target, 'kube', 'code-engine' or 'zos'."
  default     = "kube"
}

######## Code Engine Vars #####################

variable "code_engine_project" {
  type        = string
  description = "The name of the Code Engine project to use. Created if it does not exist."
  default     = ""
}

variable "code_engine_region" {
  type        = string
  description = "The region to create/lookup for the Code Engine project."
  default     = ""
}

variable "code_engine_resource_group" {
  type        = string
  description = "The resource group of the Code Engine project."
  default     = "Default"
}

############# End Code Engine ########################

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

variable "add_pipeline_definitions" {
  type        = string
  description = "Set to `true` to add pipeline definitions."
  default     = "true"
}

variable "ci_pipeline_branch" {
  type        = string
  description = "The branch within CI pipeline definitions repository for Compliance CI Toolchain."
  default     = "open-v10"
}

variable "ci_pipeline_git_tag" {
  type        = string
  description = "The GIT tag within the CI pipeline definitions repository for Compliance CI Toolchain."
  default     = ""
}

variable "pr_pipeline_branch" {
  type        = string
  description = "The branch within PR pipeline definitions repository for Compliance CI Toolchain."
  default     = "open-v10"
}

variable "pr_pipeline_git_tag" {
  type        = string
  description = "The GIT tag within the PR pipeline definitions repository for Compliance CI Toolchain."
  default     = ""
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

variable "pipeline_doi_api_key_secret_name" {
  type        = string
  description = "Name of the Cloud API key secret in the secret provider to access the toolchain containing the Devops Insights instance."
  default     = ""
}

variable "doi_toolchain_id_pipeline_property" {
  type        = string
  description = "The DevOps Insights instance toolchain ID."
  default     = ""
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

variable "worker_id" {
  type        = string
  default     = "public"
  description = "The identifier for the Managed Pipeline worker."
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

######SonarQube ############################
variable "sonarqube_integration_name" {
  type        = string
  description = "The name of the SonarQube integration."
  default     = "SonarQube"
}

variable "sonarqube_user" {
  type        = string
  description = "The name of the SonarQube user."
  default     = ""
}

variable "sonarqube_secret_name" {
  type        = string
  description = "The name of the SonarQube secret."
  default     = "sonarqube-secret"
}

variable "sonarqube_is_blind_connection" {
  type        = string
  description = "When set to `true`, instructs IBM Cloud Continuous Delivery to not validate the configuration of this integration. Set this to true if the SonarQube server is not addressable on the public internet."
  default     = true
}

variable "sonarqube_server_url" {
  type        = string
  description = "The URL to the SonarQube server."
  default     = ""
}

####### Event Notifications #################
variable "event_notifications_tool_name" {
  type        = string
  description = "The name of the Event Notifications integration."
  default     = "Event Notifications"
}

variable "event_notifications_crn" {
  type        = string
  description = "The CRN for the Event Notifications instance."
  default     = ""
}

####### Trigger properties ###################
variable "create_custom_repository_default_triggers" {
  type        = string
  description = "Set to `true` to add default triggers for the repositories specified in the repositories JSON, if custom triggers are not set."
  default     = "true"
}

variable "create_triggers" {
  type        = string
  description = "Set to `true` to create the default triggers associated with the compliance repos and sample app."
  default     = "true"
}

variable "create_git_triggers" {
  type        = string
  description = "Set to `true` to create the default Git triggers associated with the compliance repos and sample app."
  default     = "true"
}

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

variable "pipeline_properties" {
  type        = string
  description = "Stringified JSON containing the properties. This takes precedence over the properties JSON."
  default     = ""
}

variable "pipeline_properties_filepath" {
  type        = string
  description = "The path to the file containing the property JSON. If this is not set, it will by default read the `properties.json` file at the root of the module."
  default     = ""
}

variable "repository_properties" {
  type        = string
  description = "Stringified JSON containing the repositories and triggers. This takes precedence over the repositories JSON."
  default     = ""
}

variable "repository_properties_filepath" {
  type        = string
  description = "The path to the file containing the repository and triggers JSON. If this is not set, it will by default read the `repositories.json` file at the root of the module."
  default     = ""
}

variable "default_locked_properties" {
  type        = list(string)
  description = "List of default locked properties"
  default     = ["artifactory-dockerconfigjson", "cluster", "cluster-namespace", "cluster-region", "compliance-baseimage", "cos-api-key", "cos-bucket-name", "cos-endpoint", "cra-bom-generate", "cra-deploy-analysis", "cra-generate-cyclonedx-format", "cra-vulnerability-scan", "custom-image-tag", "dev-region", "dev-resource-group", "doi-environment", "doi-ibmcloud-api-key", "doi-toolchain-id", "event-notifications", "evidence-repo", "git-token", "gosec-private-repository-host", "gosec-private-repository-ssh-key", "ibmcloud-api", "ibmcloud-api-key", "incident-repo", "inventory-repo", "opt-in-dynamic-api-scan", "opt-in-dynamic-scan", "opt-in-dynamic-ui-scan", "opt-in-gosec", "opt-in-sonar", "peer-review-compliance", "pipeline-config", "pipeline-config-branch", "pipeline-config-repo", "pipeline-dockerconfigjson", "print-code-signing-certificate", "registry-namespace", "registry-region", "signing-key", "slack-notifications", "sonarqube", "sonarqube-config", "version"]
}

variable "repo_blind_connection" {
  type        = string
  description = "Setting this value to `true` means the server is not addressable on the public internet. IBM Cloud will not be able to validate the connection details you provide. Certain functionality that requires API access to the git server will be disabled. Delivery pipeline will only work using a private worker that has network access to the git server."
  default     = ""
}

variable "repo_git_id" {
  type        = string
  description = "The Git ID for the compliance repositories."
  default     = ""
}

variable "repo_git_provider" {
  type        = string
  description = "The Git provider type."
  default     = ""
}

variable "repo_root_url" {
  type        = string
  description = "(Optional) The Root URL of the server. e.g. https://git.example.com."
  default     = ""
}

variable "repo_title" {
  type        = string
  description = "(Optional) The title of the server. e.g. My Git Enterprise Server."
  default     = ""
}

variable "repo_group" {
  type        = string
  description = "Specify the Git user or group for your application. This must be set if the repository authentication type is `pat` (personal access token)."
  default     = ""
}

variable "repo_git_token_crn" {
  type        = string
  description = "The CRN of the  Git token secret in the secret provider. Specifying a CRN for the Git Token automatically sets the authentication type to `pat`."
  default     = ""
}

variable "repo_git_token_secret_name" {
  type        = string
  description = "Name of the Git token secret in the secret provider. Specifying a secret name for the Git Token automatically sets the authentication type to `pat`."
  default     = ""
}

variable "repo_auth_type" {
  type        = string
  description = "The auth type for the repo `oauth` or 'pat` (personal access token). Applies to all the default compliance repositories but can be overriden by the repository specific variable."
  default     = ""
}

variable "repo_integration_owner" {
  type        = string
  description = "The integration owner of the repository. Applies to all the default compliance repositories but can be overriden by the repository specific variable."
  default     = ""
}
