module "webhooks" {
  source          = "./modules/webhooks"
  for_each        = var.webhooks
  url             = each.url
  pipeline_events = each.value.pipeline_events
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
