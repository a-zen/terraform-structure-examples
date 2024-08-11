locals {
  run_cpu       = var.container.size == "small" ? "1" : "2"
  run_memory    = var.container.size == "small" ? "1024M" : "2048M"
  run_min_scale = var.container.size == "small" ? "1" : "3"
  run_max_scale = var.container.size == "small" ? "3" : "9"
  sql_tier      = var.database.size == "small" ? "db-1-2048" : "db-2-4096"
}

module "cloud_run_service" {
  source = "../cloud_run_service"

  project  = var.project
  name     = var.name
  cpu      = local.run_cpu
  memory   = local.run_memory
  minScale = local.run_min_scale
  maxScale = local.run_max_scale
  tag      = var.container.tag
  envs     = var.container.envs
  secrets  = var.container.secrets
}

module "cloud_sql" {
  source = "../cloud_sql"

  project          = var.project
  name             = "${var.name}-sql"
  tier             = local.sql_tier
  database_version = "${upper(var.database.type)}_${upper(var.database.version)}"
}

module "pubsub_subscriptions" {
  source   = "../pubsub_subscription"
  for_each = var.eventStreaming.subscriptions

  project           = var.project
  subscription_name = "${var.name}-${each.key}"
  topic_name        = each.value.topic
  push_endpoint     = each.value.endpoint
}
