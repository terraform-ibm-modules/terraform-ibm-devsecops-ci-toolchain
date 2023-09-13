##############################################################################
# Outputs
##############################################################################

output "pipeline_id" {
  value = ibm_cd_tekton_pipeline.pr_pipeline_instance.pipeline_id
}
