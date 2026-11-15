# Create IAM user
resource "aws_iam_user" "user" {
  name = "iamuser_kirsty"

  tags = {
    Name = "iamuser_kirsty"
  }
}

# Create IAM Policy
resource "aws_iam_policy" "policy" {
  name        = "iampolicy_kirsty"
  description = "IAM policy allowing EC2 read actions for kirsty"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["ec2:Read*"]
        Resource = "*"
      }
    ]
  })
}
data "aws_caller_identity" "current" {
  
}

resource "aws_iam_user_policy_attachment" "kirsty_attachment" {
  user       = "iamuser_kirsty"
  policy_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/iampolicy_kirsty"
}

