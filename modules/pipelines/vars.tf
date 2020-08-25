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
