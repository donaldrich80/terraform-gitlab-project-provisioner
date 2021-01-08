
resource "gitlab_project" "project" {
  name                                             = var.name
  visibility_level                                 = var.visibility_level
  path                                             = var.path
  issues_enabled                                   = var.issues_enabled
  request_access_enabled                           = var.request_access_enabled
  merge_method                                     = var.merge_method
  lfs_enabled                                      = var.lfs_enabled
  wiki_enabled                                     = var.wiki_enabled
  packages_enabled                                 = var.packages_enabled
  snippets_enabled                                 = var.snippets_enabled
  merge_requests_enabled                           = var.merge_requests_enabled
  container_registry_enabled                       = var.container_registry_enabled
  default_branch                                   = var.default_branch
  description                                      = var.description
  pipelines_enabled                                = true
  shared_runners_enabled                           = var.shared_runners_enabled
  archived                                         = var.archived
  remove_source_branch_after_merge      = var.remove_source_branch_after_merge
  only_allow_merge_if_all_discussions_are_resolved = var.only_allow_merge_if_all_discussions_are_resolved
  only_allow_merge_if_pipeline_succeeds            = var.only_allow_merge_if_pipeline_succeeds
  lifecycle {
    prevent_destroy = true
  }
}

variable "name" {
  type        = string
  description = "The name of the project"
  default     = "name"
}
variable "visibility_level" {
  type        = string
  description = "Set to public to create a public project. Valid values are private, internal, public. Repositories are created as private by default."
  default     = "private"
}
variable "path" {
  type        = string
  description = "Numeric project ID"
  default     = "path"
}
variable "description" {
  type        = string
  description = "A description of the project"
  default     = "Managed by Terraform"
}

variable "project" {
  type        = string
  description = "Path of the repository"
  default     = "project"
}

# variable "tags" {
#   # type        = string
#   description = "Project tags"
# }

variable "deploy_key" {
  type        = string
  description = "Path of the repository"
  default     = "ssh-key"
}

variable "default_branch" {
  type        = string
  description = "The default branch for the project"
  default     = "master"
}

# variable "gitlab_token" {
#   type        = string
#   description = "This is the GitLab personal access token"
# }

# variable "token" {
#   type        = string
#   description = "This is the GitLab personal access token"
# }

variable "remove_source_branch_after_merge" {
  type        = bool
  description = "Whether to remove a branch after its merged"
  default     = true
}

variable "archived" {
  type        = bool
  description = "Whether the project is in read-only mode (archived). Repositories can be archived/unarchived by toggling this parameter."
  default     = false
}

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

variable "packages_enabled" {
  type        = bool
  description = "Enable packages for the project"
  default     = false
}

variable "lfs_enabled" {
  type        = bool
  description = "Enable LFS for the project"
  default     = false
}

variable "snippets_enabled" {
  type        = bool
  description = "Enable snippets for the project"
  default     = false
}

variable "wiki_enabled" {
  type        = bool
  description = "Enable wiki for the project"
  default     = false
}

variable "request_access_enabled" {
  type        = bool
  description = "Allow users to request member access"
  default     = false
}

variable "shared_runners_enabled" {
  type        = bool
  description = "Enable shared runners for this project"
  default     = false
}

variable "pipelines_enabled" {
  type        = bool
  description = "Enable pipelines for this project"
  default     = true
}

