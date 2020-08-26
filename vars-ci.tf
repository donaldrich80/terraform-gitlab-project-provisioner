variable "pipelines_enabled" {
  type        = bool
  description = "Enable pipelines for the project"
  default     = true
}

variable "shared_runners_enabled" {
  type        = bool
  description = "Enable shared runners for this project"
  default     = true
}

variable "protected_ci_vars" {
  description = "List of private variables"
  type        = map(string)
  default = {}
}

# variable "unprotected_ci_vars" {
#   description = "List of public variables"
#   type        = map(string)
#   default = {}
# }

# variable "scheduled_pipeline_vars" {
#   description = "scheduled_pipeline_vars"
#   type        = map(string)
#   default = {}
# }

variable "scheduled_pipelines" {
  description = "Map of scheduled_pipelines to configuration."
  type        = map
  default     = {
    weekly = {
      pipeline_cron = "0 6 * * *"
      branch = "master"
      pipeline_vars = {
        foo = "bar"
      }
    }
  }
}

variable "cron_timezone" {
  type        = string
  description = "Timezone for Cron scheduled pipelines"
  default = "America/Chicago"
}