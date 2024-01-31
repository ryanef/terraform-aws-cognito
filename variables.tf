variable "user_pool_name" {
  type = string
  default = "devuserpool"
}

variable "auto_verified_attributes" {
  default = ["email"]
}

variable "environment" {
  default = "dev"
  type = string
}

variable "id_pool_allow_unauthenticated_id" {
  type = bool
  default = false
}
variable "user_pool_client_name" {
  type = string
  default = "devuserclient"
}

variable "id_pool_name" {
  type = string
  default = "tfidpool"
}

variable "schema_attribute_name" {
  default = "name"
  type = string
}
variable "attribute_data_type" {
  default = "String"
  type = string
}

variable "pw_min_length" {
  type = number
  default = 8
}

variable "explicit_auth_flows" {
  description = "ADMIN_NO_SRP_AUTH, CUSTOM_AUTH_FLOW_ONLY, USER_PASSWORD_AUTH, ALLOW_ADMIN_USER_PASSWORD_AUTH, ALLOW_CUSTOM_AUTH, ALLOW_USER_PASSWORD_AUTH, ALLOW_USER_SRP_AUTH, ALLOW_REFRESH_TOKEN_AUTH"
  default = ["ALLOW_REFRESH_TOKEN_AUTH", "ALLOW_USER_SRP_AUTH"]
  type = list(string)
}

variable "allowed_oauth_flows" {
  default = ["code", "implicit"]
  type = list(string)
}

variable "refresh_token_validity" {
  type = number
  default = 1
}

variable "client_generate_secret" {
  default = false
  type = bool
}

variable "pw_require_symbols" {
  type = bool
  default = false
}

variable "callback_urls" {
  type = list(string)
  default = ["http://localhost"]
}
variable "pw_require_uppercase" {
  type = bool
  default = false
}
variable "schemas" {
  default = [
    {
      attribute_data_type = "String",
      name = "name",
      mutable = true,
      required=true
    }
  ]
}

variable "lambda_pc_arn" {
  default = null
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