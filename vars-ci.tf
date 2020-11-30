# variable "pipelines_enabled" {
#   type        = bool
#   description = "Enable pipelines for the project"
#   default     = true
# }

variable "protected_ci_vars" {
  description = "List of protected but unmasked variables"
  type        = map(string)
  default     = {}
}

variable "protected-masked-ci-vars" {
  description = "List of protected and masked variables"
  type        = map(string)
  default     = {}
}

variable "scheduled_pipelines" {
  description = "Map of scheduled_pipelines to configuration."
  type        = map
  default     = {}
  #  example
  #   default = {
  #     weekly = {
  #       pipeline_cron = "0 6 * * *"
  #       branch        = "master"
  #     }
  #   }
}

variable "cron_timezone" {
  type        = string
  description = "Timezone for Cron scheduled pipelines"
  default     = "America/Chicago"
}
