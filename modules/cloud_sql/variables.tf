variable "project" {
  type = string
}

variable "name" {
  type = string
}

variable "database_version" {
  type    = string
  default = "POSTGRES_15"
}

variable "tier" {
  type = string
}
