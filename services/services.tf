####################################################################################
#
# IBM Kubernetes Services Details
#
####################################################################################

# output "ibm_container_cluster_name" {
#   value = data.ibm_container_cluster.kubernetes_cluster.name
# }

####################################################################################
#
# IBM Container Registry Services Details
#
####################################################################################


####################################################################################
#
# IBM Key Protect Services Details
#
####################################################################################

# data ibm_resource_instance "key_protect_instance" {
#   name = var.key_protect_instance_name
# }

# output "key_protect_instance_guid" {
#   value = data.ibm_resource_instance.key_protect_instance.guid
# }

# output "key_protect_instance_name" {
#   value = data.ibm_resource_instance.key_protect_instance.name
# }

data "ibm_resource_group" "kp_resource_group" {
  count = var.enable_key_protect ? 1 : 0
  name  = var.kp_resource_group
}
data "ibm_resource_instance" "key_protect_instance" {
  count             = var.enable_key_protect ? 1 : 0
  service           = "kms"
  name              = var.kp_name
  resource_group_id = data.ibm_resource_group.kp_resource_group[0].id
  location          = var.kp_location
}

output "kp_instance_guid" {
  value       = try(data.ibm_resource_instance.key_protect_instance[0].guid, "")
  description = "GUID of the Key Protect service instance in IBM Cloud"
}

data "ibm_resource_group" "sm_resource_group" {
  count = (var.enable_secrets_manager == true) && (var.sm_instance_crn == "") ? 1 : 0
  name  = var.sm_resource_group
}
data "ibm_resource_instance" "secrets_manager_instance" {
  count             = (var.enable_secrets_manager == true) && (var.sm_instance_crn == "") ? 1 : 0
  service           = "secrets-manager"
  name              = var.sm_name
  resource_group_id = data.ibm_resource_group.sm_resource_group[0].id
  location          = var.sm_location
}
