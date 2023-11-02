provider "aws" {
  region = "eu-central-1" # Set your desired AWS region
}

resource "aws_dynamodb_table" "userTable" {
  name         = "userTable"
  billing_mode = "PAY_PER_REQUEST" # On-demand capacity mode

  attribute {
    name = "ID"
    type = "N" # Number attribute for a unique identifier
  }

  attribute {
    name = "first_name"
    type = "S" # String attribute for first name
  }

  attribute {
    name = "last_name"
    type = "S" # String attribute for last name
  }

  attribute {
    name = "email_address"
    type = "S" # String attribute for email address
  }

  attribute {
    name = "city"
    type = "S" # String attribute for city
  }

  tags = {
    Environment = "Dev"
  }



  global_secondary_index {
    name            = "EmailIndex"
    hash_key        = "email_address"
    projection_type = "ALL"
  }

  ttl {
    attribute_name = "expiration_time" # Enable Time to Live (TTL) for automatic data expiration
    enabled        = true
  }

  point_in_time_recovery {
    enabled = true # Enable Point-in-Time Recovery
  }
}