
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

resource "gitlab_branch_protection" "master_branch_protection" {
  branch = "master"
  push_access_level = "maintainer"
  merge_access_level = "maintainer"
  project   = var.project
}

module "deploy_key" {
  project = var.project
  source  = "./modules/deploy_key"
}

module "pipelines" {
  source = "./modules/pipelines"
  pipelines_enabled       = var.pipelines_enabled
  pipeline_cron           = var.pipeline_cron
  project                 = var.project
  scheduled_pipeline_vars = var.scheduled_pipeline_vars
}
  # source = "git::git@github.com:hashicorp/terraform-aws-consul.git//modules/consul-cluster?ref=v0.0.1"
