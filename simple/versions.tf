terraform {
  required_version = ">= 1.5.0"
}
terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = ">= 2.5.1"
    }
  }
}
