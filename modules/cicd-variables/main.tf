resource "gitlab_project_variable" "protected-ci-vars" {
    # count    = var.pipelines_enabled ? 1 : 0
    for_each = var.protected_ci_vars
    environment_scope = "*"
    key       = each.key
    value     = each.value
    protected = true
    project   = var.gitlab_project_id
    depends_on = [gitlab_project.project]
}

resource "gitlab_project_variable" "unprotected-ci-vars" {
    # count    = var.pipelines_enabled ? 1 : 0
    for_each = var.unprotected_ci_vars
    environment_scope = "*"
    key       = each.key
    value     = each.value
    protected = false
    project   = var.gitlab_project_id
    depends_on = [gitlab_project.project]
}