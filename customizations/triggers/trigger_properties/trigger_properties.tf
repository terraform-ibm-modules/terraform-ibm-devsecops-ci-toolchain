locals {
  trigger_property_type = (var.trigger_property_type == "") ? "text" : var.trigger_property_type
}


resource "ibm_cd_tekton_pipeline_trigger_property" "trigger_property_text" {
  count       = (local.trigger_property_type == "text") ? 1 : 0
  name        = var.trigger_property_name
  type        = "text"
  value       = var.trigger_property_value
  pipeline_id = var.pipeline_id
  trigger_id  = var.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "trigger_property_enum" {
  count       = (local.trigger_property_type == "enum") ? 1 : 0
  name        = var.trigger_property_name
  type        = "single_select"
  enum        = ["0", "1"]
  value       = var.trigger_property_value
  pipeline_id = var.pipeline_id
  trigger_id  = var.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "trigger_property_secure" {
  count       = (local.trigger_property_type == "secure") ? 1 : 0
  name        = var.trigger_property_name
  type        = "secure"
  value       = var.trigger_property_value
  pipeline_id = var.pipeline_id
  trigger_id  = var.trigger_id
}

resource "ibm_cd_tekton_pipeline_trigger_property" "trigger_property_integration" {
  count       = (local.trigger_property_type == "integration") ? 1 : 0
  name        = var.trigger_property_name
  type        = "integration"
  value       = var.trigger_property_value
  path        = var.trigger_property_path
  pipeline_id = var.pipeline_id
  trigger_id  = var.trigger_id
}
