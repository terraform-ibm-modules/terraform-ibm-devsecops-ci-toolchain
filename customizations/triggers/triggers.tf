#Supported triggers
# - manual
# - timer/cron
# - Git
locals {
  cron_schedule            = (try(var.trigger_data.cron_schedule, "") == "") ? "0 4 * * *" : var.trigger_data.cron_schedule
  time_zone                = (try(var.trigger_data.time_zone, "") == "") ? "UTC" : var.trigger_data.time_zone
  trigger_type             = (try(var.trigger_data.type, "") == "") ? "manual" : var.trigger_data.type
  pipeline_id              = var.trigger_data.pipeline_data[var.trigger_data.pipeline_id]
  trigger_name             = (try(var.trigger_data.name, "") == "") ? "" : var.trigger_data.name
  event_listener           = var.trigger_data.event_listener
  max_concurrent_runs      = var.trigger_data.max_concurrent_runs
  trigger_enable           = var.trigger_data.enabled
  worker_id                = var.trigger_data.worker_id
  enable_events_from_forks = var.trigger_data.enable_events_from_forks


  # Events = push, pull_request, pull_request_closed
  input_events      = try(var.trigger_data.events, "")
  contains_pr_close = (strcontains(local.input_events, "pull_request_closed")) ? concat([], ["pull_request_closed"]) : []
  #remove "pull_request_closed" from input event string due to "pull_request" being a substring of "pull_request_closed"
  input_events_filtered = replace(local.input_events, "pull_request_closed", "")
  contains_pull_request = (strcontains(local.input_events_filtered, "pull_request")) ? concat(local.contains_pr_close, ["pull_request"]) : local.contains_pr_close
  resolved_events       = (strcontains(local.input_events_filtered, "push")) ? concat(local.contains_pull_request, ["push"]) : local.contains_pull_request

  repo_url_raw = try(trimsuffix(var.trigger_data.repo_url, ".git"), "")
  repo_url     = format("%s%s", local.repo_url_raw, ".git")
  repo_branch  = try(var.trigger_data.default_branch, "master")
  repo_pattern = var.trigger_data.pattern
  repo_filter  = var.trigger_data.filter

  # if both pattern and filter are set then ignore the case and default to using a branch value
  # Otherwise both pattern or cel filter value will take priority
  resolved_branch = ((local.repo_pattern == "" && local.repo_filter == "") ? local.repo_branch :
  (local.repo_pattern != "" && local.repo_filter != "") ? local.repo_branch : null)

  resolved_pattern = (local.repo_pattern != "" && local.repo_filter == "") ? local.repo_pattern : null
  resolved_filter  = (local.repo_pattern == "" && local.repo_filter != "") ? local.repo_filter : null

  # Adding pipeline_id and property_name to generate a unique map key
  pre_process_property_data = flatten([for prop in var.trigger_data.properties : {
    pipeline_id               = local.pipeline_id
    property                  = prop
    type                      = prop.type
    name                      = prop.name
    repository_integration_id = var.repository_integration_id
    config_data               = var.trigger_data.config_data
    }
  ])
}

# Manual Trigger
resource "ibm_cd_tekton_pipeline_trigger" "pipeline_manual_trigger" {
  count               = (local.trigger_type == "manual") ? 1 : 0
  pipeline_id         = local.pipeline_id
  type                = "manual"
  name                = local.trigger_name
  event_listener      = local.event_listener
  enabled             = local.trigger_enable
  max_concurrent_runs = local.max_concurrent_runs
  worker {
    id = local.worker_id
  }
}

# Timed Trigger
resource "ibm_cd_tekton_pipeline_trigger" "pipeline_timed_trigger" {
  count               = (local.trigger_type == "timer") ? 1 : 0
  pipeline_id         = local.pipeline_id
  type                = "timer"
  name                = local.trigger_name
  event_listener      = local.event_listener
  cron                = local.cron_schedule
  timezone            = local.time_zone
  enabled             = local.trigger_enable
  max_concurrent_runs = local.max_concurrent_runs
  worker {
    id = local.worker_id
  }
}

# Git Trigger
resource "ibm_cd_tekton_pipeline_trigger" "pipeline_scm_trigger" {
  count                    = (local.trigger_type == "git" || local.trigger_type == "scm") ? 1 : 0
  pipeline_id              = local.pipeline_id
  type                     = "scm"
  name                     = local.trigger_name
  event_listener           = local.event_listener
  events                   = local.resolved_events
  enabled                  = local.trigger_enable
  enable_events_from_forks = local.enable_events_from_forks
  filter                   = local.resolved_filter
  source {
    type = "git"
    properties {
      url     = local.repo_url
      branch  = local.resolved_branch
      pattern = local.resolved_pattern
    }
  }
  max_concurrent_runs = local.max_concurrent_runs
  worker {
    id = local.worker_id
  }
}

#This is the structure being passed with each loop
# into `trigger_property_data`
#  {
#    "name" = "param1"
#    "type" = "text"
#    "value" = "example1"
#  }

module "trigger_properties" {
  source = "../properties"
  for_each = tomap({
    for t in local.pre_process_property_data : "${t.type}-${t.name}" => t
  })
  pipeline_id = local.pipeline_id
  trigger_id = (
    ((local.trigger_type == "scm") || (local.trigger_type == "git")) ? ibm_cd_tekton_pipeline_trigger.pipeline_scm_trigger[0].trigger_id :
    (local.trigger_type == "manual") ? ibm_cd_tekton_pipeline_trigger.pipeline_manual_trigger[0].trigger_id :
    (local.trigger_type == "timer") ? ibm_cd_tekton_pipeline_trigger.pipeline_timed_trigger[0].trigger_id : ""
  )
  is_trigger_property = true
  property_data       = each.value
}
