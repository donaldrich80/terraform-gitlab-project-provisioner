
resource "gitlab_project" "project" {
  namespace_id               = var.parent_id
  name                       = var.name
  # id                         = var.project_id
  issues_enabled             = var.issues_enabled
  lfs_enabled                = var.lfs_enabled
  wiki_enabled               = var.wiki_enabled
  snippets_enabled           = var.snippets_enabled
  merge_requests_enabled     = var.merge_requests_enabled
  container_registry_enabled = var.container_registry_enabled
  default_branch             = var.default_branch
  description                = var.description
  # tags             = ["ansible"]
}

resource "gitlab_branch_protection" "master_branch_protection" {
  branch = "master"
  push_access_level = "maintainer"
  merge_access_level = "maintainer"
  project   = var.project
}

resource "gitlab_project_variable" "VAULT_ADDR" {
    environment_scope = "*"
    key       = "VAULT_ADDR"
    value     = var.VAULT_ADDR
    protected = true
    project   = var.project
    depends_on = [gitlab_project.project]
}

resource "gitlab_project_variable" "VAULT_TOKEN" {
    environment_scope = "*"
    key       = "VAULT_TOKEN"
    value     = var.VAULT_TOKEN
    protected = true
    project   = var.project
    depends_on = [gitlab_project.project]
}

resource "gitlab_project_variable" "JWT_LOGIN" {
    environment_scope = "*"
    key       = "JWT_LOGIN"
    value     = var.JWT_LOGIN
    protected = true
    project   = var.project
    depends_on = [gitlab_project.project]
}

# resource "gitlab_project_variable" "DOCKERHUB_PASS" {
#     environment_scope = "*"
#     key       = "DOCKERHUB_PASS"
#     value     = var.DOCKERHUB_PASS
#     protected = true
#     project   = var.project
#     depends_on = [gitlab_project.project]
# }

# resource "gitlab_project_variable" "DOCKERHUB_USER" {
#     environment_scope = "*"
#     key       = "DOCKERHUB_USER"
#     value     = var.DOCKERHUB_USER
#     protected = true
#     project   = var.project
#     depends_on = [gitlab_project.project]
# }

resource "gitlab_project_variable" "private-ci-vars" {
    for_each = var.private_variables
    environment_scope = "*"
    key       = each.key
    value     = each.value
    protected = true
    project   = var.project
    depends_on = [gitlab_project.project]
}

resource "gitlab_pipeline_schedule" "scheduled-pipeline" {
   project     = var.project
   description = "Scheduled Pipeline"
   ref         = "master"
   cron        = var.pipeline_cron
   active      = true
   cron_timezone = "America/Chicago"
}