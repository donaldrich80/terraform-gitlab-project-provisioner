
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
  source = "./modules/deploy_key"

  # source = "git::git@github.com:hashicorp/terraform-aws-consul.git//modules/consul-cluster?ref=v0.0.1"

resource "gitlab_project_variable" "private-ci-vars" {
    for_each = var.private_variables
    environment_scope = "*"
    key       = each.key
    value     = each.value
    protected = true
    project   = var.project
    depends_on = [gitlab_project.project]
}

resource "gitlab_pipeline_schedule" "scheduled" {
   project     = var.gitlab_project.project.id
   description = "Scheduled Pipeline"
   ref         = "master"
   cron        = var.pipeline_cron
   active      = true
   cron_timezone = "America/Chicago"
}

resource "gitlab_pipeline_schedule_variable" "example" {
  project              = var.gitlab_project.project.id
  pipeline_schedule_id = var.gitlab_pipeline_schedule.scheduled.id
  key                  = "EXAMPLE_KEY"
  value                = "example"
}