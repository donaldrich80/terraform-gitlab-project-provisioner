resource "gitlab_deploy_key" "global" {
  project = var.project
  title   = "Example deploy key"
  key     = var.deploy_key
}

resource "gitlab_deploy_key_enable" "foo" {
  project = var.project
  key_id  = gitlab_deploy_key.global.id
}
