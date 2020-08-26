# resource "gitlab_branch_protection" "master_branch_protection" {
#   branch = "master"
#   push_access_level = "maintainer"
#   merge_access_level = "maintainer"
#   project   = var.project
# }

resource "gitlab_branch_protection" "main" {
  branch = var.branch
  push_access_level = var.push_access_level
  merge_access_level = var.merge_access_level
  project   = var.project
}