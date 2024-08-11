project       = "prd"
run_min_scale = 3
run_max_scale = 9
db_tier       = "db-custom-2-4096"

additional_pubsub_subscriptions = {
  statistics = {
    name          = "my-service-statistics"
    topic         = "statistics"
    push_endpoint = "https://my-service/statistics",
  }
}
