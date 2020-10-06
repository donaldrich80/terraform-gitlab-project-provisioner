resource "gitlab_project_variable" "protected-ci-vars" {
  for_each          = var.protected_ci_vars
  environment_scope = "*"
  key               = each.key
  value             = each.value
  protected         = true
  project           = var.project
  masked            = true
  # depends_on = [gitlab_project.project]
}
