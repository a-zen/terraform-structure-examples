variable "project" {
  type = string
}

variable "name" {
  type = string
}

variable "cpu" {
  type = string
}

variable "memory" {
  type = string
}

variable "minScale" {
  type = string
}

variable "maxScale" {
  type = string
}

variable "tag" {
  type = string
}

variable "envs" {
  type = map(string)
}

variable "secrets" {
  type = map(string)
}
