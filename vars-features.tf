variable "container_registry_enabled" {
  type        = bool
  description = "Enable container registry for the project"
  default     = false
}

variable "initialize_with_readme" {
  type        = bool
  description = "Create master branch with first commit containing a README.md file"
  default     = false
}

variable "issues_enabled" {
  type        = bool
  description = "Enable issue tracking for the project"
  default     = false
}

variable "lfs_enabled" {
  type        = bool
  description = "Enable LFS for the project"
  default     = false
}

variable "merge_requests_enabled" {
  type        = bool
  description = "Enable merge requests for the project"
  default     = false
}

variable "pipelines_enabled" {
  type        = bool
  description = "Enable pipelines for the project"
  default     = false
}

variable "shared_runners_enabled" {
  type        = bool
  description = "Enable shared runners for this project"
  default     = true
}

variable "snippets_enabled" {
  type        = bool
  description = ""
  default     = false
}

variable "wiki_enabled" {
  type        = bool
  description = "Enable wiki for the project"
  default     = false
}
