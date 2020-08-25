variable "pipeline_cron" {
  type        = string
  description = "CRON for scheduled pipeline"
  default = "0 6 * * *"
}

variable "pipelines_enabled" {
  type        = bool
  description = "Enable pipelines for the project"
  default     = true
}

variable "project" {
  type        = string
  description = "Path of the repository"
}

variable "scheduled_pipeline_vars" {
  description = "scheduled_pipeline_vars"
  type        = map(string)
  default = {}
}