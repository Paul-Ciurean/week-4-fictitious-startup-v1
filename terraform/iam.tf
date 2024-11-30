resource "aws_iam_instance_profile" "instance_profile" {
  name = "instance_profile"
  role = aws_iam_role.role.name
}

resource "aws_iam_role" "role" {
  name               = "instance_profile_role"
  path               = "/"
  assume_role_policy = file("InstanceRole.json")
}