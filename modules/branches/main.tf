resource "gitlab_branch_protection" "master_branch_protection" {
  branch = "master"
  push_access_level = "maintainer"
  merge_access_level = "maintainer"
  project   = var.project
}