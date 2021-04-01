resource "gitlab_project_hook" "hook" {
  project         = var.project
  url             = var.url
  pipeline_events = var.pipeline_events
  merge_requests_events = var.merge_requests_events
  push_events = var.push_events
  enable_ssl_verification = var.enable_ssl_verification
  tag_push_events = var.tag_push_events
}

variable "pipeline_events" {
  type        = bool
  description = "pipeline_events"
  default     = false
}

variable "merge_requests_events" {
  type        = bool
  description = "merge_requests_events"
  default     = false
}

variable "push_events" {
  type        = bool
  description = "push_events"
  default     = false
}

variable "tag_push_events" {
  type        = bool
  description = "tag_push_events"
  default     = false
}


variable "enable_ssl_verification" {
  type        = bool
  description = "enable_ssl_verification"
  default     = true
}

variable "project" {
  type        = string
  description = "Path of the repository"
}

variable "url" {
  type        = string
  description = "webhook url"
}

// token - (Optional) A token to present when invoking the hook.

// push_events_branch_filter - (Optional) Invoke the hook for push events on matching branches only.

// issues_events - (Optional) Invoke the hook for issues events.

// confidential_issues_events - (Optional) Invoke the hook for confidential issues events.

// note_events - (Optional) Invoke the hook for notes events.

// confidential_note_events - (Optional) Invoke the hook for confidential notes events.

// job_events - (Optional) Invoke the hook for job events.

// wiki_page_events - (Optional) Invoke the hook for wiki page events.

// deployment_events - (Optional) Invoke the hook for deployment events.
