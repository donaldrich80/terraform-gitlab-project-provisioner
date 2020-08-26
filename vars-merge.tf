variable "merge_method" {
  type        = string
  description = "Merge method to use on merge requests"
  default     = "merge"
}

variable "approvals_before_merge" {
  type        = number
  description = "Number of merge request approvals required for merging"
  default     = 0
}

variable "only_allow_merge_if_all_discussions_are_resolved" {
  type        = bool
  description = "Set to true if you want allow merges only if all discussions are resolved"
  default     = true
}

variable "only_allow_merge_if_pipeline_succeeds" {
  type        = bool
  description = "Set to true if you want allow merges only if a pipeline succeeds"
  default     = true
}

variable "protected_branches" {
  description = "Map of project names to configuration."
  type        = map
  default     = {
    master = {
      push_access_level = "maintainer"
      merge_access_level = "maintainer"
    }
  }
}

variable "merge_requests_enabled" {
  type        = bool
  description = "Enable merge requests for the project"
  default     = false
}
