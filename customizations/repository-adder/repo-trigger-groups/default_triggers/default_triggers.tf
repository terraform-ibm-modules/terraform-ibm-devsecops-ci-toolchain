locals {
  repo_name = basename(var.repository_url)
  listener = (
    (strcontains(var.repository_url, "git.cloud.ibm.com")) ? "listener-gitlab" : "listener"
  )

  manual         = true
  git            = true
  pr             = false
  repo_url_raw   = try(trimsuffix(var.repository_url, ".git"), "")
  repo_url       = format("%s%s", local.repo_url_raw, ".git")
  ci_pipeline_id = var.pipeline_data.ci
  pr_pipeline_id = var.pipeline_data.pr


  repo_branch     = var.default_branch
  repo_ci_filter  = var.default_trigger_ci_cel_filter
  repo_pr_filter  = var.default_trigger_pr_cel_filter
  repo_ci_pattern = var.default_trigger_ci_pattern
  repo_pr_pattern = var.default_trigger_pr_pattern

  # if both pattern and filter are set then ignore the case and default to using a branch value
  # Otherwise both pattern or cel filter value will take priority
  resolved_ci_branch = ((local.repo_ci_pattern == "" && local.repo_ci_filter == "") ? local.repo_branch :
  (local.repo_ci_pattern != "" && local.repo_ci_filter != "") ? local.repo_branch : null)

  resolved_pr_branch = ((local.repo_pr_pattern == "" && local.repo_pr_filter == "") ? local.repo_branch :
  (local.repo_pr_pattern != "" && local.repo_pr_filter != "") ? local.repo_branch : null)

  resolved_ci_pattern = (local.repo_ci_pattern != "" && local.repo_ci_filter == "") ? local.repo_ci_pattern : null
  resolved_ci_filter  = (local.repo_ci_pattern == "" && local.repo_ci_filter != "") ? local.repo_ci_filter : null

  resolved_pr_pattern = (local.repo_pr_pattern != "" && local.repo_pr_filter == "") ? local.repo_pr_pattern : null
  resolved_pr_filter  = (local.repo_pr_pattern == "" && local.repo_pr_filter != "") ? local.repo_pr_filter : null
}

# MANUAL TRIGGER FOR CI PIPELINE

resource "ibm_cd_tekton_pipeline_trigger" "pipeline_manual_trigger" {
  count               = (local.manual) ? 1 : 0
  pipeline_id         = local.ci_pipeline_id
  type                = "manual"
  name                = join(" - ", ["Manual", local.repo_name])
  event_listener      = "ci-${local.listener}"
  enabled             = true
  max_concurrent_runs = var.max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger_property" "trigger_property_app_name" {
  count       = (local.manual) ? 1 : 0
  pipeline_id = local.ci_pipeline_id
  name        = "app-name"
  type        = "text"
  value       = local.repo_name
  trigger_id  = ibm_cd_tekton_pipeline_trigger.pipeline_manual_trigger[0].trigger_id
  #locked     = local.input_locked
}

resource "ibm_cd_tekton_pipeline_trigger_property" "trigger_property_branch" {
  count       = (local.manual) ? 1 : 0
  pipeline_id = local.ci_pipeline_id
  name        = "branch"
  type        = "text"
  value       = var.default_branch
  trigger_id  = ibm_cd_tekton_pipeline_trigger.pipeline_manual_trigger[0].trigger_id
  #locked     = local.input_locked
}

resource "ibm_cd_tekton_pipeline_trigger_property" "trigger_property_repo_url" {
  count       = (local.manual) ? 1 : 0
  pipeline_id = local.ci_pipeline_id
  name        = "repository"
  type        = "integration"
  value       = var.repository_integration_id
  path        = "parameters.repo_url"
  trigger_id  = ibm_cd_tekton_pipeline_trigger.pipeline_manual_trigger[0].trigger_id
  #locked     = local.input_locked
}

# GIT TRIGGER FOR CI PIPELINE
resource "ibm_cd_tekton_pipeline_trigger" "pipeline_scm_trigger" {
  count          = (local.git) ? 1 : 0
  pipeline_id    = local.ci_pipeline_id
  type           = "scm"
  name           = join(" - ", ["Git", local.repo_name])
  event_listener = "ci-${local.listener}"
  events         = (local.resolved_ci_filter != null) ? null : ["push"]
  enabled        = true
  filter         = local.resolved_ci_filter
  source {
    type = "git"
    properties {
      url     = local.repo_url
      branch  = local.resolved_ci_branch
      pattern = local.resolved_ci_pattern
    }
  }
  max_concurrent_runs = var.max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger_property" "trigger_property_git_app_name" {
  count       = (local.git) ? 1 : 0
  pipeline_id = local.ci_pipeline_id
  name        = "app-name"
  type        = "text"
  value       = local.repo_name
  trigger_id  = ibm_cd_tekton_pipeline_trigger.pipeline_scm_trigger[0].trigger_id
  #locked     = local.input_locked
}

# GIT TRIGGER FOR PR PIPELINE
resource "ibm_cd_tekton_pipeline_trigger" "pipeline_scm_pr_trigger" {
  count          = (local.git) ? 1 : 0
  pipeline_id    = local.pr_pipeline_id
  type           = "scm"
  name           = join(" - ", ["Git PR", local.repo_name])
  event_listener = "pr-${local.listener}"
  events         = (local.resolved_pr_filter != null) ? null : ["pull_request"]
  enabled        = true
  filter         = local.resolved_pr_filter
  source {
    type = "git"
    properties {
      url     = local.repo_url
      branch  = local.resolved_pr_branch
      pattern = local.resolved_pr_pattern
    }
  }
  max_concurrent_runs = var.max_concurrent_runs
}

resource "ibm_cd_tekton_pipeline_trigger_property" "trigger_property_pr_git_app_name" {
  count       = (local.git) ? 1 : 0
  pipeline_id = local.pr_pipeline_id
  name        = "app-name"
  type        = "text"
  value       = local.repo_name
  trigger_id  = ibm_cd_tekton_pipeline_trigger.pipeline_scm_pr_trigger[0].trigger_id
  #locked     = local.input_locked
}
