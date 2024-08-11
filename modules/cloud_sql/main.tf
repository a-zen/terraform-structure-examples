resource "local_file" "default" {
  content  = jsonencode({ "project" = var.project, "name" = var.name, "database_version" = var.database_version, "tier" = var.tier })
  filename = "deployment/${var.project}/cloud_sql_${var.name}.json"
}
