variable "pipeline_cron" {
  type        = string
  description = "CRON for scheduled pipeline"
  default = "0 6 * * *"
}

variable "pipelines_enabled" {
  type        = bool
  description = "Enable pipelines for the project"
  default     = false
}

variable "project" {
  type        = string
  description = "Path of the repository"
}

variable "description" {
  type        = string
  description = "description"
  default = "Automatic"
}

variable "branch" {
  type        = string
  description = "branch"
  default = "master"
}

variable "cron_timezone" {
  type        = string
  description = "cron_timezone"
  default = "America/Chicago"
}

variable "scheduled_pipeline_vars" {
  description = "scheduled_pipeline_vars"
  type        = map(string)
  default = {}
}
