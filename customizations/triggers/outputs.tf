##############################################################################
# Outputs
##############################################################################

output "trigger_id" {
  value = (
    (local.trigger_type == "scm") ? ibm_cd_tekton_pipeline_trigger.pipeline_scm_trigger[0].trigger_id :
    (local.trigger_type == "manual") ? ibm_cd_tekton_pipeline_trigger.pipeline_manual_trigger[0].trigger_id :
    (local.trigger_type == "timer") ? ibm_cd_tekton_pipeline_trigger.pipeline_timed_trigger[0].trigger_id : ""
  )
}