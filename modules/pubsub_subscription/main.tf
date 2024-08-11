resource "local_file" "default" {
  content  = jsonencode({ "project" = var.project, "subscription_name" = var.subscription_name, "topic_name" = var.topic_name, "push_endpoint" = var.push_endpoint })
  filename = "deployment/${var.project}/pubsub_subscription_${var.subscription_name}.json"
}
