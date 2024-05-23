#Supported triggers
# - manual
# - timer/cron
# - Git

locals {
  #trigger_type  = (var.trigger_type == "") ? "manual" : var.trigger_type
  #cron_schedule = (var.cron_schedule == "") ? "0 4 * * *" : var.cron_schedule
  #time_zone     = (var.time_zone == "") ? "UTC" : var.time_zone
  trigger_type   = (var.trigger_data.type == "") ? "manual" : var.trigger_data.type
  #pipeline_id    = 
}


# Manual Trigger
resource "ibm_cd_tekton_pipeline_trigger" "pipeline_manual_trigger" {
  count               = (local.trigger_type == "manual") ? 1 : 0
  pipeline_id         = var.trigger_data.pipeline_id
  type                = "manual"
  name                = var.trigger_data.name
  event_listener      = "ci-listener-gitlab"
  enabled             = true #var.trigger_enable
  max_concurrent_runs = 1 #var.max_concurrent_runs
}

# Timed Trigger
#resource "ibm_cd_tekton_pipeline_trigger" "pipeline_timed_trigger" {
#  count               = (local.trigger_type == "timer") ? 1 : 0
#  pipeline_id         = var.pipeline_id
#  type                = "timer"
#  name                = var.trigger_name
#  event_listener      = var.event_listener
#  cron                = local.cron_schedule
#  timezone            = local.time_zone
#  enabled             = var.trigger_enable
#  max_concurrent_runs = var.max_concurrent_runs
#}

# Git Trigger
#resource "ibm_cd_tekton_pipeline_trigger" "pipeline_scm_trigger" {
#  count          = (local.trigger_type == "git" || local.trigger_type == "scm") ? 1 : 0
#  pipeline_id    = var.pipeline_id
#  type           = "scm"
#  name           = var.trigger_name
#  event_listener = var.event_listener
#  events         = var.trigger_events
#  enabled        = var.trigger_enable
#  source {
#    type = "git"
#    properties {
#      url    = var.repo_url
#      branch = var.repo_branch
#    }
#  }
#  max_concurrent_runs = var.max_concurrent_runs
#}

#This is the structure being passed with each loop
# into `trigger_property_data`
#  {
#    "name" = "param1"
#    "type" = "text"
#    "value" = "example1"
#  }