resource "aws_iam_instance_profile" "instance_profile" {
  name = "instance_profile"
  role = aws_iam_role.role.name
}

resource "aws_iam_role" "role" {
  name               = "instance_profile_role"
  assume_role_policy = {
    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
  }
}

resource "aws_iam_role_policy_attachment" "name" {
  role = aws_iam_role.role.name
  policy_arn = var.role_ssm
}