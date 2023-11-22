provider "aws" {
  region = "eu-central-1" # Replace with your desired AWS region
}

resource "aws_iam_role" "iam_role_for_aws_lambda" {
  name = "iam_role_for_aws_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "lambda_policy_for_aws_lambda_function" {
  name        = "lambda_policy_for_aws_lambda_function"
  description = "IAM policy for Lambda function"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "sqs:ReceiveMessage",
        "sqs:DeleteMessage"
      ],
      "Resource": "arn:aws:sqs:eu-central-1:382567467042:firstqueueforIampolicy"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:PutObject",
        "s3:GetObject"
      ],
      "Resource": "arn:aws:s3:::aqshey-bucket1/*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_attachment" {
  policy_arn = aws_iam_policy.lambda_policy_for_aws_lambda_function.arn
  role       = aws_iam_role.iam_role_for_aws_lambda.name
}

resource "aws_iam_role_policy_attachment" "defaultRole" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = aws_iam_role.iam_role_for_aws_lambda.name
}

# Create an API Gateway
resource "aws_api_gateway_rest_api" "example_api" {
  name        = "example_api"
  description = "Example API Gateway"
}
# Create a resource in the API Gateway
resource "aws_api_gateway_resource" "example_resource" {
  rest_api_id = aws_api_gateway_rest_api.example_api.id
  parent_id   = aws_api_gateway_rest_api.example_api.root_resource_id
  path_part   = "example"
}

# Create a POST method for the resource
resource "aws_api_gateway_method" "example_method" {
  rest_api_id   = aws_api_gateway_rest_api.example_api.id
  resource_id   = aws_api_gateway_resource.example_resource.id
  http_method   = "POST"
  authorization = "NONE"
}


# Create an IAM role for Lambda execution
resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com",
      },
    }],
  })
}
