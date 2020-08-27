
# About

This module is designed to allow you to codify the features, settings, branches, environmental variables, accessibility, and build pipelines of Gitlab projects using the Hashicorp provider. In addition to being able to provision new projects, it also useful for ensure standardized, immutable setting to all of your projects quickly and easily.

Did one of the credintial variables im all your projects get changed recently?  Want to turn off ALL your CI pipelines while your on vacation?  With Terraform and GitLab working together, it's insanely easy.

# Functions

* General project settings

Enable/Disable Features


* Granular Branch restrictions

* Fully customizable scheduled build pipelines, including unique ci variable assignment to each one

* Deployment keys

# Default settings

This module's default to the most restrictive and paranoid repository and build pipeline configurations. Y

The choice of the default setting was to choose whatever options which aired on the side of security, privacy, etc. This module aims for safest defaults, but you are pretty much able to override any setting accesible by the API, but the coolest thing is being able to manipulate settings across all your repositories.




