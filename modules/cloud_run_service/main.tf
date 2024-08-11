resource "local_file" "default" {
  content = jsonencode({
    "project"  = var.project,
    "name"     = var.name,
    "cpu"      = var.cpu,
    "memory"   = var.memory,
    "minScale" = var.minScale,
    "maxScale" = var.maxScale,
    "tag"      = var.tag,
    "envs"     = var.envs,
    "secrets"  = var.secrets
  })
  filename = "deployment/${var.project}/cloud_run_serivce_${var.name}.json"
}
