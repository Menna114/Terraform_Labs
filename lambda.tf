resource "aws_lambda_function" "send_email_lambda" {
  function_name    = "SendSESEmail"
  role            = aws_iam_role.lambda_role.arn
  handler         = "lambda.lambda_handler" 
  runtime         = "python3.9"
  filename        = "lambda_function.zip"
  environment {
    variables = {
      SOURCE_EMAIL = "mennadiaah14@gmail.com"
      DEST_EMAIL = "mennadiaah14@gmail.com"
      ENVIRONMENT  = var.env
    }
  }
}

resource "aws_s3_bucket" "bucket"{
    bucket = "lab3bucketmenna"
}
resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.send_email_lambda.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.bucket.arn
}

resource "aws_s3_bucket_notification" "s3_lambda_trigger" {
  bucket = aws_s3_bucket.bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.send_email_lambda.arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = "terraform.tfstate"
  }
  depends_on = [aws_lambda_permission.allow_s3]
}