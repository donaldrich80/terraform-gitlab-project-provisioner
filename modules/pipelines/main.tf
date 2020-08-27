resource "gitlab_pipeline_schedule" "scheduled" {
    project     = var.project
    description = var.description
    ref         = var.branch
    cron        = var.pipeline_cron
    active      = var.pipelines_enabled
    cron_timezone = var.cron_timezone
    lifecycle {
        create_before_destroy = true
    }
}

resource "gitlab_pipeline_schedule_variable" "vars" {
    for_each             = var.pipeline_vars
    project              = var.project
    pipeline_schedule_id = gitlab_pipeline_schedule.scheduled.id
    key                  = each.key
    value                = each.value
    lifecycle {
        create_before_destroy = true
    }
}


