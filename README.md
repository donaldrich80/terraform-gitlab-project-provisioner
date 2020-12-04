# terraform-gitlab-project-provisioner

## About

This module is designed to codify the features, settings, branches, environmental variables, accessibility, and build pipelines of Gitlab projects using the Hashicorp provider. In addition to being able to provision new projects, it also useful for ensuring standardized and immutable settings to all of your projects quickly and easily. Parameters that were formerly set project by project, can now be set on a global basis.

## Use Cases

- Provisioning a newly created self-hosted GitLab instance prior to uploading code

- Simplified method to manage/update repositories on either self-hosted or Gitlab.com

## Functionality

### General project settings

Container registry, wiki, issues, etc

### Merge/branch settings

### Branches

Declare an arbitrary number of branches, with specific push/merge access restrictions for each

### Project Variables

Declare an arbitrary number of project-wide private enviromental variables (currently, all variables are set for all environments).

### Pipelines

Declare an arbitrary number of build pipelines, each with its own arbitrary number of specific enviromental variables

### Deployment keys

## Default settings

The default settings are intended to be the most restrictive in terms of security, privacy, and non-maintainer priveleges to be secure by default. Priveledge elevation is possible for basically everything, but must be "opted-in" by explicitly overriding the defaults.

The most noticable exception to this is the variable which disables pipelines for a project. I've encountered issues enabling/disabling this feature due to Terraform attempting to refresh the state of variables in pipelines which have been deleted. A functional equivelency to this is using the "pipeline enabled" variable at a project level. Most of my GitLab projects have build pipelines, so there is no motivation for me to investigate/fix this.

## Usage

Declare global CI variables and project settings:

```
variable "DOCKERHUB_USER" {
  default = "DOCKERHUB_USER"
}

variable "visibility_level" {
  default = "public"
}

module "project1" {
  source           = "github.com/donaldrich80/terraform-gitlab-project-provisioner"
  name             = "Project 1"
  path             = "project1"
  project          = "username/project1"
  visibility_level = var.visibility_level
  gitlab_token     = var.gitlab_token
  protected_ci_vars = {
    "DOCKERHUB_USER" = var.DOCKERHUB_USER
  }
}

module "project2" {
  source           = "github.com/donaldrich80/terraform-gitlab-project-provisioner"
  name             = "Project 2"
  path             = "project2"
  project          = "username/project2"
  visibility_level = var.visibility_level
  gitlab_token     = var.gitlab_token
  protected_ci_vars = {
    "DOCKERHUB_USER" = var.DOCKERHUB_USER
  }
}
```

A repo using default settings with a few private variables declared:

```
module "my-private-project" {
  source       = "github.com/donaldrich80/terraform-gitlab-project-provisioner"
  name         = "My Private Project"
  path         = "my-private-project"
  project      = "username/my-private-project"
  gitlab_token = var.gitlab_token
  protected_ci_vars = {
  "DOCKERHUB_PASS" = var.DOCKERHUB_PASS
  "DOCKERHUB_USER" = var.DOCKERHUB_USER
  "VAULT_ADDR"     = var.VAULT_ADDR
  "VAULT_TOKEN"    = var.VAULT_TOKEN
  }
}
```

A _public_ repo using default settings with private variables and a scheduled pipeline (and variable) declared:

```
module "my-public-project" {
  source           = "github.com/donaldrich80/terraform-gitlab-project-provisioner"
  name             = "My Public Project"
  path             = "my-public-project"
  project          = "username/my-public-project"
  visibility_level = "public"
  gitlab_token     = var.gitlab_token
  protected_ci_vars = {
    "DOCKERHUB_PASS" = var.DOCKERHUB_PASS
    "DOCKERHUB_USER" = var.DOCKERHUB_USER
    "VAULT_ADDR"     = var.VAULT_ADDR
    "VAULT_TOKEN"    = var.VAULT_TOKEN
  }
  scheduled_pipelines = {
    weekly = {
    pipeline_cron = "0 4 * * *"
    branch        = "master"
    pipeline_vars = {
    foo = "bar"
    }
  }
}
```

## Import existing projects

Note: its easiest to remove your variables/pipelines before importing, Terraform sometimes throws up errors trying to overwrite variables, also the old pipelines/variables will not be accounted in the plan. It is probably possible to import them one by one, but I don't consider this worth the extra effort, as they can all be restored en masse once in Terraform.

Add a new module block to your configuration:

```
module "my-imported-project" {
  source           = "github.com/donaldrich80/terraform-gitlab-project-provisioner"
  name             = "my-imported-project"
  project          = "username/my-existing-project"
  path             = "my-imported-project"
  gitlab_token     = var.gitlab_token
}
```

Load module:

```
terraform init
```

Import resource:

```
terraform import module.my-imported-project.gitlab_project.project username/my-existing-project
```

Apply config:

```
terraform apply
```

## TODO

Add protected tags
