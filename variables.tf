variable "user_pool_name" {
  type = string
  default = "devuserpool"
}

variable "user_pool_client_name" {
  type = string
  default = "devuserclient"
}

variable "schema_attribute_name" {
  default = "name"
  type = string
}

variable "schema_mutable" {
  default = true
  type = bool
}

variable "schema_required" {
  default = false
  type = bool
}
variable "default_email_option" {
  default = "CONFIRM_WITH_CODE"
  type = string
  description = "CONFIRM_WITH_CODE or CONFIRM_WITH_LINK."
}