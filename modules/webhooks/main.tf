resource "gitlab_project_hook" "hook" {
  project               = var.project
  url                   = var.url
  pipeline_events = true
}
