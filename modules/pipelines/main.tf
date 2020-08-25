resource "gitlab_pipeline_schedule" "scheduled" {
    # count        = var.pipelines_enabled ? 1 : 0
    project     = var.project
    description = "Scheduled Pipeline"
    ref         = "master"
    cron        = var.pipeline_cron
    active      = true
    cron_timezone = "America/Chicago"
}

resource "gitlab_pipeline_schedule_variable" "example" {
    # count                = var.pipelines_enabled ? 1 : 0
    project              = var.project
    pipeline_schedule_id = gitlab_pipeline_schedule.scheduled.id
    key                  = "EXAMPLE_KEY"
    value                = "example"
}