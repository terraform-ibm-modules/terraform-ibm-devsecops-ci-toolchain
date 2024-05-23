locals {

   pre_process_prop_data = flatten([for prop in var.data.properties :{
          pipeline_id = var.data.pipeline_id
          property = prop
          prop_name = prop.name
        }
    ])
}

module "property" {
  source         = "../properties"
  for_each        = tomap({
    for t in local.pre_process_prop_data: "${t.pipeline_id}-${t.prop_name}" => t
  })
  data = each.value
  pipeline_id = var.pipeline_id
}
