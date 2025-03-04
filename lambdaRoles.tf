resource "aws_iam_role" "lambda_role" {
  name = "lambda_send_email_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "ses_send_policy" {
  name        = "LambdaSESSendPolicy"
  description = "Allows Lambda to send emails via SES"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "ses:SendEmail"
        Resource = "*"  # Or restrict it to specific SES identities
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_ses_policy_attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.ses_send_policy.arn
}
