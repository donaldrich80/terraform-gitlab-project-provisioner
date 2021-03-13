terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "~> 3.5.0"
    }
  }
  required_version = ">= 0.14"
}
