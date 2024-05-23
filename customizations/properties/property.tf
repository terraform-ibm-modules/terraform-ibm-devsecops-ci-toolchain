# TYPES
  # enum -> only used when type is set to single_select
  # name -> max length = 253 chars, allowed characters = /^[-0-9a-zA-Z_.]{1,253}$/
  # path -> min length =0, max length = 4096, allowed characters = /^[-0-9a-zA-Z_.]*$/
  # pipeline_id -> max length = 36, allowed characters = /^[-0-9a-z]+$/
  # type -> allowed options = secure, text, single_select, integration, appconfig
  # locked -> true or false (default false)

locals {
  input_pipeline_id = try(var.data.pipeline_id, "") 

   pipeline_id = (
    (local.input_pipeline_id == "ci") ? var.ci_pipeline_id :
    (local.input_pipeline_id == "pr") ? var.pr_pipeline_id :
    (local.input_pipeline_id != "") ? local.input_pipeline_id : var.ci_pipeline_id
  )

  input_target = try(var.data.property.target, "")
  input_name = try(var.data.property.name, "")
  input_type = try(var.data.property.type, "text")
  input_value = try(var.data.property.value, "hello")
  input_path = try(var.data.property.path, null)
  input_enum = try(jsondecode(var.data.property.enum), null)
  input_locked = try(var.data.property.locked, false)

  #input_pipeline_id = try(var.data.pipeline_id, "") 
 # pipeline_id = (
 #   (local.input_pipeline_id == "ci") ? var.ci_pipeline_id :
 #   (local.input_pipeline_id == "pr") ? var.pr_pipeline_id :
 #   (local.input_pipeline_id != "") ? local.input_pipeline_id : var.ci_pipeline_id
 # )

  #is_valid_type = (local.input_type == "secure" || local.input_type == "text" || local.input_type == "single_select" || local.input_type == "integration" || local.input_type == "appconfig") ? true : false
  #is_name_valid = ((length(local.input_name) > 0) && (length(local.input_name) < 254)) ? true : false
  #is_enum = (
  #  ((local.input_type == "single_select") && (local.input_enum != null)) ? true :
  #  ((local.input_type != "single_select") && (local.input_enum == null)) ? true : false
  #)

  #add_property = ((local.is_valid_type == true) && (local.is_name_valid == true) && (local.is_enum == true))
}

resource "ibm_cd_tekton_pipeline_property" "pipeline_propetry" {
  count       = (local.input_target != "trigger") ? 1 : 0
  pipeline_id = local.pipeline_id
  name        = local.input_name
  type        = local.input_type
  value       = local.input_value
  path        = local.input_path
  enum        = local.input_enum
  #locked     = local.input_locked
}

resource "ibm_cd_tekton_pipeline_trigger_property" "trigger_propetry" {
  count       = (local.input_target == "trigger") ? 1 : 0
  pipeline_id = local.pipeline_id
  name        = local.input_name
  type        = local.input_type
  value       = local.input_value
  path        = local.input_path
  enum        = local.input_enum
  trigger_id  = local.pipeline_id
  #locked     = local.input_locked
}