# terraform-gitlab-project-provisioner


## About

This module is designed to codify the features, settings, branches, environmental variables, accessibility, and build pipelines of Gitlab projects using the Hashicorp provider. In addition to being able to provision new projects, it also useful for ensuring standardized and immutable settings to all of your projects quickly and easily. Settings that were once set project by project, can now be set on a global basis.

Did one of the credintial variables im all your projects get changed recently?  Want to turn off ALL your CI pipelines while your on vacation?  With Terraform and GitLab working together, it's insanely easy.

## Functionality

### Current

* General project settings

Container registry, wiki, issues, etc

* Merge/branch settings

* Branches

Declare an arbitrary number of branches, with specific push/merge access restrictions for each

* Build pipelines/variables

Declare an arbitrary number of project-wide private enviromental variables. Currently, all variables are set for all environments.

Declare an arbitrary number of build pipelines, each with an arbitrary number of specific enviromental variables

* Deployment keys

### Future

## Default settings

The default settings are intended to be the most restrictive in terms of security, privacy, and non-maintainer priveleges in an attempt to be secure by default. Priveledge elevation is possible for basically everything, but must be "opted-in" by explicitly overriding the defaults.

The most noticable exception to this is the variable which disables pipelines for a project. Currently, there are issues enabling/disabling this variable due to Terraform attempting to refresh the state of variables on pipelines which have been deleted. A functional equivelency to this is using the "Pipeline enabled" variable at a project level. Most of my GitLab projects have build pipelines, so there is no motivation for me to investigate or fix this.

## Usage

A repo using default settings with a few private variables declared:

```yaml
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

A *public* repo using default settings with private variables and a scheduled pipeline (and variable) declared:

```yaml
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
}
```




