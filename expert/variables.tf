variable "project" {
  type = string
}

variable "run_min_scale" {
  type = number
}

variable "run_max_scale" {
  type = number
}

variable "db_tier" {
  type = string
}

variable "toggle_feat_xy" {
  type    = bool
  default = false
}

variable "additional_pubsub_subscriptions" {
  type = map(object({
    name          = string
    topic         = string
    push_endpoint = string
  }))
  default = {}
}
