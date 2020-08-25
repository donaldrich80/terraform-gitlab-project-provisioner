resource "gitlab_deploy_key" "global" {
  project = "${gitlab_project.project.id}"
  title = "Example deploy key"
  key = "ssh-rsa AAAA..."
}

# # Enable the deployment key on the second repo
# resource "gitlab_deploy_key_enable" "foo" {
#   project = "${gitlab_project.project.id}"
#   key_id = "${gitlab_deploy_key.global.id}"
# }