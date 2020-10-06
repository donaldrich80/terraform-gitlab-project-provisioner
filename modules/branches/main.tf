resource "gitlab_branch_protection" "main" {
  branch             = var.branch
  push_access_level  = var.push_access_level
  merge_access_level = var.merge_access_level
  project            = var.project
}
