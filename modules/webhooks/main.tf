resource "gitlab_project_hook" "hook" {
  project         = var.project
  url             = var.url
  pipeline_events = var.pipeline_events
}

variable "pipeline_events" {
  type        = bool
  description = "pipeline_events"
  default     = false
}

// token - (Optional) A token to present when invoking the hook.

// enable_ssl_verification - (Optional) Enable ssl verification when invoking the hook.

// push_events - (Optional) Invoke the hook for push events.

// push_events_branch_filter - (Optional) Invoke the hook for push events on matching branches only.

// issues_events - (Optional) Invoke the hook for issues events.

// confidential_issues_events - (Optional) Invoke the hook for confidential issues events.

// merge_requests_events - (Optional) Invoke the hook for merge requests.

// tag_push_events - (Optional) Invoke the hook for tag push events.

// note_events - (Optional) Invoke the hook for notes events.

// confidential_note_events - (Optional) Invoke the hook for confidential notes events.

// job_events - (Optional) Invoke the hook for job events.

// pipeline_events - (Optional) Invoke the hook for pipeline events.

// wiki_page_events - (Optional) Invoke the hook for wiki page events.

// deployment_events - (Optional) Invoke the hook for deployment events.
