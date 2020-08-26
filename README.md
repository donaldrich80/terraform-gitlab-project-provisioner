

# About

This module attempts to default to the most restrictive and paranoid repository and build pipeline configurations.

This module includes the ability to configure the following:

General project settings

Granular Branch restrictions

Fully customizable scheduled build pipelines, including unique ci variable assignment to each one

Deployment keys

# Default settings

The choice of the default setting was to choose whatever options which aired on the side of security, privacy, etc. This module aims for safest defaults, but you are pretty much able to override any setting accesible by the API, but the coolest thing is being able to manipulate settings across all your repositories. Did one of the variables you use in all your build pipelines change recently?  Want to turn off ALL your CI pipelines while your on vacation?  With Terraform and GitLab working together, it's insanely easy.



