# Disabling CI/PR pipelines
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

# Default app repo integration move
moved {
  from = module.app_repo
  to   = module.app_repo[0]
}

# Default evidence repo integration move
moved {
  from = module.evidence_repo
  to   = module.evidence_repo[0]
}
