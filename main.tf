resource "aws_cognito_user_pool" "pool" {
  name = var.user_pool_name

   account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
  }

  email_configuration {
    email_sending_account = "COGNITO_DEFAULT"
  }

  schema {
    attribute_data_type = "String"
    name = var.schema_attribute_name
    mutable = var.schema_mutable
    required = var.schema_required
  }

  verification_message_template {
    default_email_option = var.default_email_option
    
  }

}

resource "aws_cognito_user_pool_client" "client" {
  name = var.user_pool_client_name

  user_pool_id = aws_cognito_user_pool.pool.id
}
