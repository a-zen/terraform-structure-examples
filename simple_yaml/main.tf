locals {
  config = yamldecode(file(var.config_file))
}

module "backend_service" {
  source = "../modules/backend_service"

  project = local.config.project
  name    = local.config.name

  container = {
    size    = local.config.container.size
    tag     = local.config.container.tag
    envs    = local.config.container.env
    secrets = local.config.container.secrets
  }

  database = {
    size    = local.config.database.size
    type    = local.config.database.type
    version = local.config.database.version
  }

  eventStreaming = local.config.eventStreaming
}
