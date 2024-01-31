resource "aws_cognito_user_pool" "pool" {
  name = var.user_pool_name
  auto_verified_attributes = toset(var.auto_verified_attributes)
   account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
  }

  lambda_config {
    post_confirmation = var.lambda_pc_arn
  }

  password_policy {
    minimum_length = var.pw_min_length
    require_symbols = var.pw_require_symbols
    require_uppercase = var.pw_require_uppercase
  }

  dynamic "schema" {
    for_each = var.schemas
    content {
      attribute_data_type = schema.value["attribute_data_type"]
      name = schema.value["name"]
      mutable = schema.value["mutable"]
      required = schema.value["required"]
      string_attribute_constraints {
        max_length = "2048"
        min_length = "0"
      }
    }
  }
}

resource "aws_cognito_user_pool_client" "client" {
  name = var.user_pool_client_name
  user_pool_id = aws_cognito_user_pool.pool.id
  explicit_auth_flows = var.explicit_auth_flows
  allowed_oauth_flows = var.allowed_oauth_flows
  refresh_token_validity = var.refresh_token_validity
  generate_secret = var.client_generate_secret
  callback_urls = var.callback_urls
}

resource "aws_cognito_identity_pool" "main" {
  identity_pool_name               = "idpool-${var.id_pool_name}-${var.environment}"
  allow_unauthenticated_identities = var.id_pool_allow_unauthenticated_id

  cognito_identity_providers {
    client_id               = aws_cognito_user_pool_client.client.id
    provider_name           = aws_cognito_user_pool.pool.endpoint
    server_side_token_check = false
  }

  # supported_login_providers = {
  #   "graph.facebook.com"  = "7346241598935552"
  #   "accounts.google.com" = "123456789012.apps.googleusercontent.com"
  # }
}