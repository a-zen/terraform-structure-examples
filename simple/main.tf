module "backend_service" {
  source = "../modules/backend_service"

  project = var.project
  name    = "my-service"

  container = {
    size = var.container_size
    tag  = "abcdef-v1.0.0"
    envs = {
      SOME_VARIABLE = "something"
    }
    secrets = {
      SECRET_VARIABLE = "my-api-key"
    }
  }

  database = {
    size    = var.database_size
    type    = "postgres"
    version = 15
  }

  eventStreaming = {
    subscriptions = {
      orders = {
        topic    = "orders"
        endpoint = "/orders"
      }
      registrations = {
        topic    = "registrations"
        endpoint = "/registrations"
      }
    }
  }
}
