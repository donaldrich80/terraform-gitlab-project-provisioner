
resource "gitlab_project" "project" {
  # namespace_id               = var.parent_id
  name                       = var.name
  path                       = var.path
  issues_enabled             = var.issues_enabled
  lfs_enabled                = var.lfs_enabled
  wiki_enabled               = var.wiki_enabled
  snippets_enabled           = var.snippets_enabled
  merge_requests_enabled     = var.merge_requests_enabled
  container_registry_enabled = var.container_registry_enabled
  default_branch             = var.default_branch
  description                = var.description
}

# module "branch_protection" {
#   source = "./modules/branches"
#   for_each = var.protected_branches
#   branch = each.key
#   push_access_level = each.value.push_access_level
#   merge_access_level = each.value.merge_access_level
#   project = var.project
# }

resource "gitlab_branch_protection" "main" {
  for_each = var.protected_branches
  branch = each.key
  push_access_level = each.value.push_access_level
  merge_access_level = each.value.merge_access_level
  project   = var.project
}

# module "deploy_key" {
#   project = var.project
#   deploy_key = var.deploy_key
#   source  = "./modules/deploy_key"
# }

module "pipeline-vars" {
  source = "./modules/pipeline-vars"
  protected_ci_vars       = var.protected_ci_vars
  unprotected_ci_vars     = var.unprotected_ci_vars
  project                 = var.project
}

module "pipelines" {
  source = "./modules/pipelines"
  for_each = var.scheduled_pipelines
  description   = each.key
  pipelines_enabled       = var.pipelines_enabled
  pipeline_cron           = each.value.pipeline_cron
  project                 = var.project
  branch                  = each.value.branch
  cron_timezone           = var.cron_timezone
  pipeline_vars           = each.value.pipeline_vars
  # scheduled_pipeline_vars = each.value.scheduled_pipeline_vars
}
  # source = "git::git@github.com:hashicorp/terraform-aws-consul.git//modules/consul-cluster?ref=v0.0.1"
