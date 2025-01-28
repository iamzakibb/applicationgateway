variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "service_plan_sku" {
  type    = string
  default = "B1"
}

variable "app_service_plan_id" {
  type    = string
  default = null
}

variable "app_name" {
  type    = string
  default = "webapp"
}