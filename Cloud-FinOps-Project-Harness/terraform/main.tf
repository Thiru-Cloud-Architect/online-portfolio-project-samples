provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "harness_data" {
  bucket = "harness-finops-data-bucket"
}

resource "aws_iam_role" "lambda_exec" {
  name = "harness_lambda_execution_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = { Service = "lambda.amazonaws.com" },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "s3_access" {
  name = "HarnessLambdaS3Access"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = ["s3:PutObject"],
      Resource = "${aws_s3_bucket.harness_data.arn}/*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attach" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = aws_iam_policy.s3_access.arn
}

resource "aws_lambda_function" "harness_lambda" {
  function_name = "harness-finops-reporter"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.10"
  role          = aws_iam_role.lambda_exec.arn
  filename      = "${path.module}/../lambda.zip"
  source_code_hash = filebase64sha256("${path.module}/../lambda.zip")

  environment {
    variables = {
      HARNESS_API_KEY    = "replace_with_your_api_key"
      HARNESS_ACCOUNT_ID = "replace_with_your_account_id"
      S3_BUCKET          = aws_s3_bucket.harness_data.bucket
      S3_KEY_PREFIX      = "harness-finops/"
    }
  }
}
