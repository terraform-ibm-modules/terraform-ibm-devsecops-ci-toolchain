locals {


  # TYPES
  # enum -> only used when type is set to single_select
  # name -> max length = 253 chars, allowed characters = /^[-0-9a-zA-Z_.]{1,253}$/
  # path -> min length =0, max length = 4096, allowed characters = /^[-0-9a-zA-Z_.]*$/
  # pipeline_id -> max length = 36, allowed characters = /^[-0-9a-z]+$/
  # type -> allowed options = secure, text, single_select, integration, appconfig
  # locked -> true or false (default false)

  # Preprocess input json to ensure all required fields are present
  #pre_process_prop_data = flatten([for prop in jsondecode(var.data) :{
  #    properties = try(prop.properties, {})
  #  }
  #])

  trigger_id = null
  #property_json = jsondecode(var.properties)
  #properties_ci = [for property in local.property_json : property]

  input_name = try(var.data.pipeline_id, "")
  input_type = try(var.data.type, "text")
  input_value = try(var.data.value, "hello")
  input_path = try(var.data.path, null)
  input_enum = try(var.data.enum, null)
  input_locked = try(var.data.locked, false)

  #input_name = try(var.name, "")
  #input_type = try(var.type, "")
  #input_value = try(var.value, "")
  #input_path = try(var.path, null)
  #input_enum = try(var.enum, null)
  #input_locked = try(var.locked, false)
  
  input_pipeline_id = try(var.data.pipeline_id, "") 

  pipeline_id = (
    (local.input_pipeline_id == "ci") ? var.ci_pipeline_id :
    (local.input_pipeline_id == "pr") ? var.pr_pipeline_id :
    (local.input_pipeline_id != "") ? local.input_pipeline_id : var.ci_pipeline_id
  )

  is_valid_type = (local.input_type == "secure" || local.input_type == "text" || local.input_type == "single_select" || local.input_type == "integration" || local.input_type == "appconfig") ? true : false
  is_name_valid = ((length(local.input_name) > 0) && (length(local.input_name) < 254)) ? true : false
  is_enum = (
    ((local.input_type == "single_select") && (local.input_enum != null)) ? true :
    ((local.input_type != "single_select") && (local.input_enum == null)) ? true : false
  )

  add_property = ((local.is_valid_type == true) && (local.is_name_valid == true) && (local.is_enum == true))
}

resource "ibm_cd_tekton_pipeline_property" "dynamic_propetry" {
  #count       = (local.add_property == true) ? 1 : 0
  for_each        = tomap({
    for t in var.data.properties: "${t.name}" => t
  })
  pipeline_id = local.pipeline_id
  name        = each.value.name
  type        = each.value.type
  value       = var.data.pipeline_id
  path        = local.input_path
  enum        = local.input_enum
  #locked      = local.input_locked
}
