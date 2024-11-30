variable "custom_ami_version" {
  description = "The custom AMI version"
}

variable "role_ssm" {
  description = "The role for SSM"
  default     = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}