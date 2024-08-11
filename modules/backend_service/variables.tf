variable "project" {
  type = string
}

variable "name" {
  type = string
}

variable "container" {
  type = object({
    size    = string
    tag     = string
    envs    = map(string)
    secrets = map(string)
  })
}

variable "database" {
  type = object({
    size    = string
    type    = string
    version = number
  })
}

variable "eventStreaming" {
  type = object({
    subscriptions = map(object({
      topic    = string
      endpoint = string
    }))
  })
}
