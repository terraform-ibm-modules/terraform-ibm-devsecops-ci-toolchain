locals {


  # TYPES
  # enum -> only used when type is set to single_select
  # name -> max length = 253 chars, allowed characters = /^[-0-9a-zA-Z_.]{1,253}$/
  # path -> min length =0, max length = 4096, allowed characters = /^[-0-9a-zA-Z_.]*$/
  # pipeline_id -> max length = 36, allowed characters = /^[-0-9a-z]+$/
  # type -> allowed options = secure, text, single_select, integration, appconfig


  trigger_id = null
  #property_json = jsondecode(var.properties)
  #properties_ci = [for property in local.property_json : property]
  data = var.payload
  input_name = try(var.payload.name, "")
  input_type = try(var.payload.type, "")
  input_value = try(var.payload.value, "")
  input_path = try(var.payload.path, null)
  input_enum = try(var.payload.enum, null)
  
  input_pipeline_id = try(var.payload.pipeline, "") 

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
  count       = (local.add_property == true) ? 1 : 0
  name        = local.input_name
  type        = local.input_type #"text" #local.type
  value       = local.input_value
  path        = local.input_path
  enum        = local.input_enum
  pipeline_id = local.pipeline_id
  #trigger_id  = null
}


#resource "ibm_cd_tekton_pipeline_property" "ci_dynamic_propetry" {
#  depends_on  = [module.pipeline_ci]
  #for_each    = local.property_json.properties #toset(local.properties_ci)
#  for_each = { for t in local.property_json.ci_properties : t.name => t }
#  name        = each.value.name
#  type        = try(each.value.type, "integration") # "integration" #"single_select" #each.value.type
#  value       = module.evidence_repo.repository.tool_id # "0" #each.value.value
#  path        = "parameters.blah.repo_url"
#  enum        = null #["0", "1", "2"]
#  pipeline_id = module.pipeline_ci.pipeline_id
#}

