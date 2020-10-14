
resource "gitlab_project" "project" {
  name                                             = var.name
  visibility_level                                 = var.visibility_level
  path                                             = var.path
  issues_enabled                                   = var.issues_enabled
  request_access_enabled                           = var.request_access_enabled
  merge_method                                     = var.merge_method
  lfs_enabled                                      = var.lfs_enabled
  wiki_enabled                                     = var.wiki_enabled
  snippets_enabled                                 = var.snippets_enabled
  merge_requests_enabled                           = var.merge_requests_enabled
  container_registry_enabled                       = var.container_registry_enabled
  default_branch                                   = var.default_branch
  description                                      = var.description
  shared_runners_enabled                           = var.shared_runners_enabled
  archived                                         = var.archived
  only_allow_merge_if_all_discussions_are_resolved = var.only_allow_merge_if_all_discussions_are_resolved
  only_allow_merge_if_pipeline_succeeds            = var.only_allow_merge_if_pipeline_succeeds
  lifecycle {
    prevent_destroy = true
  }
}

resource "gitlab_pipeline_trigger" "trigger" {
  project     = var.project
  description = "Terraform generated trigger"
  depends_on  = [gitlab_project.project]
}

resource "gitlab_branch_protection" "main" {
  for_each           = var.protected_branches
  branch             = each.key
  push_access_level  = each.value.push_access_level
  merge_access_level = each.value.merge_access_level
  project            = var.project
  depends_on         = [gitlab_project.project]
}

resource "gitlab_tag_protection" "all" {
  project             = var.project
  tag                 = "*"
  create_access_level = "maintainer"
  depends_on          = [gitlab_project.project]
}


# module "deploy_key" {
#   project = var.project
#   deploy_key = var.deploy_key
#   source  = "./modules/deploy_key"
# }

module "project-variables" {
  source                   = "./modules/project-variables"
  protected_ci_vars        = var.protected_ci_vars
  protected-masked-ci-vars = var.protected-masked-ci-vars
  project                  = var.project
  depends_on               = [gitlab_project.project]
}

module "pipelines" {
  source        = "./modules/pipelines"
  for_each      = var.scheduled_pipelines
  project       = var.project
  cron_timezone = var.cron_timezone
  description   = each.key
  pipeline_cron = each.value.pipeline_cron
  branch        = each.value.branch
  pipeline_vars = each.value.pipeline_vars
  depends_on    = [gitlab_project.project]
  # scheduled_pipeline_vars = each.value.scheduled_pipeline_vars
}

output "gitlab_project_id" {
  value       = gitlab_project.project.id
  description = "Id of created GitLab project"
}
