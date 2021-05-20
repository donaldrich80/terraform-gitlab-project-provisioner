module "webhooks" {
  source          = "./modules/webhooks"
  for_each        = var.webhooks
  project         = var.project
  url             = each.key
  pipeline_events = each.value.pipeline_events
  merge_requests_events = each.value.merge_requests_events
  push_events = each.value.push_events
  # enable_ssl_verification = each.value.enable_ssl_verification
  tag_push_events = each.value.tag_push_events
}

variable "webhooks" {
  description = "Project webhooks"
  type        = map
  default     = {}
  #  example
  #   webhooks = {
  #     url = {
  #       pipeline_events = true
  #       branch        = "master"
  #     }
  #   }
}
