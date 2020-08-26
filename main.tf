
resource "gitlab_project" "project" {
  name                       = var.name
  visibility_level                       = var.visibility_level
  path                       = var.path
  tags                       = var.tags
  issues_enabled             = var.issues_enabled
  merge_method               = var.merge_method
  lfs_enabled                = var.lfs_enabled
  wiki_enabled               = var.wiki_enabled
  snippets_enabled           = var.snippets_enabled
  merge_requests_enabled     = var.merge_requests_enabled
  container_registry_enabled = var.container_registry_enabled
  pipelines_enabled          = var.pipelines_enabled
  default_branch             = var.default_branch
  description                = var.description
  archived                   = var.archived
  only_allow_merge_if_all_discussions_are_resolved = var.only_allow_merge_if_all_discussions_are_resolved
  only_allow_merge_if_pipeline_succeeds            = var.only_allow_merge_if_pipeline_succeeds
}

resource "gitlab_pipeline_trigger" "trigger" {
    project   = var.project
    description = "Terraform generated trigger"
}

resource "gitlab_branch_protection" "main" {
  for_each = var.protected_branches
  branch = each.key
  push_access_level = each.value.push_access_level
  merge_access_level = each.value.merge_access_level
  project   = var.project
}

resource "gitlab_tag_protection" "all" {
  project             = var.project
  tag                 = "*"
  create_access_level = "maintainer"
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


terraform {
  required_providers {
    gitlab = {
      source = "terraform-providers/gitlab"
    }
  }
  required_version = ">= 0.13"
}

output "gitlab_project_id" {
  value       = gitlab_project.project.id
  description = "Id of created GitLab project"
}

# module "branch_protection" {
#   source = "./modules/branches"
#   for_each = var.protected_branches
#   branch = each.key
#   push_access_level = each.value.push_access_level
#   merge_access_level = each.value.merge_access_level
#   project = var.project
# }