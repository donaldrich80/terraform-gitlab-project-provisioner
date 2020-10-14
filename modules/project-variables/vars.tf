variable "project" {
  type        = string
  description = "Path of the repository"
}

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

# variable "unprotected_ci_vars" {
#   description = "List of public variables"
#   type        = map(string)
#   default = {}
# }
