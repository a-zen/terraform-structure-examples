locals {
  run_name = "awesome_service"

  pubsub_subscriptions = {
    orders = {
      name          = "${local.run_name}-orders",
      topic         = "orders",
      push_endpoint = "https://awesome-service/orders",
    },
    registrations = {
      name          = "${local.run_name}-registrations",
      topic         = "registrations",
      push_endpoint = "https://awesome-service/registrations",
    }
  }
}

module "cloud_run_service" {
  source = "../modules/cloud_run_service"

  project  = var.project
  name     = local.run_name
  cpu      = "1"
  memory   = "1024M"
  minScale = var.run_min_scale
  maxScale = var.run_max_scale
}

module "cloud_sql" {
  source = "../modules/cloud_sql"

  project = var.project
  name    = "awesome-postgresql"
  tier    = var.db_tier
}

module "pubsub_subscriptions" {
  source   = "../modules/pubsub_subscription"
  for_each = local.pubsub_subscriptions

  project           = var.project
  subscription_name = each.value.name
  topic_name        = each.value.topic
  push_endpoint     = each.value.push_endpoint
}
