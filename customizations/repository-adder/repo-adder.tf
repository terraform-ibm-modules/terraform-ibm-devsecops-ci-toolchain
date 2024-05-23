locals {
  repositories = try(var.pipeline_repo_data.repositories, "{}")
  git_token_secret_ref = try(var.pipeline_repo_data.git_token, "")
  owner              = try(var.pipeline_repo_data.owner, "")

}


#This is the structure being passed with each loop
# into `repo_data`
#   {
#      "default_branch" = "main"
#      "git_token_secret_ref" = "ref-to-secret-in-secrets-manager"
#      "mode" = "clone"
#      "name" = "test_repo"
#      "owner" = "test"
#      "repository_url" = "https://eu-es.git.cloud.ibm.com/....."
#      "triggers" = []
#      "type" = "manual"
#      "worker_id" = "public"
#    }

module "repos_and_triggers" {
  source               = "../repo-trigger-groups"
  #for_each             = { for t in local.repositories : t.repository_url => t }
  for_each = tomap({
    for t in local.repositories : "${t.repository_url}" => t
  })
  owner                = local.owner
  toolchain_id         = var.toolchain_id
  git_token_secret_ref = local.git_token_secret_ref
  repo_data            = each.value
  pipeline_id          = var.pipeline_id
}
