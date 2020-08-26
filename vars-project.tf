variable "name" {
  type        = string
  description = "The name of the project"
}

variable "description" {
  type        = string
  description = "A description of the project"
  default     = "Managed by Terraform"
}

variable "project" {
  type        = string
  description = "Path of the repository"
}

variable "tags" {
  # type        = string
  description = "Project tags"
}

variable "visibility_level" {
  type        = string
  description = "Set to public to create a public project. Valid values are private, internal, public. Repositories are created as private by default."
  default     = "private"
}

variable "path" {
  type        = string
  description = "Numeric project ID"
}

variable "deploy_key" {
  type        = string
  description = "Path of the repository"
  default = "ssh-key"
}

variable "default_branch" {
  type        = string
  description = "The default branch for the project"
  default     = "master"
}

variable "gitlab_token" {
  type        = string
  description = "This is the GitLab personal access token"
}