moved {
  from = ibm_cd_toolchain_tool_pipeline.ci_pipeline
  to   = ibm_cd_toolchain_tool_pipeline.ci_pipeline[0]
}

moved {
  from = module.pipeline_ci
  to   = module.pipeline_ci[0]
}

moved {
  from = ibm_cd_toolchain_tool_pipeline.pr_pipeline
  to   = ibm_cd_toolchain_tool_pipeline.pr_pipeline[0]
}

moved {
  from = module.pipeline_pr
  to   = module.pipeline_pr[0]
}