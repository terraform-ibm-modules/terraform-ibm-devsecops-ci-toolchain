##############################################################################
# Outputs
##############################################################################

output "sm_instance_guid" {
  value       = try(data.ibm_resource_instance.secrets_manager_instance[0].guid, "")
  description = "GUID of the Secrets Manager service instance in IBM Cloud"
}
