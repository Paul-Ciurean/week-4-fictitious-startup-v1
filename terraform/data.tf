########
# data #
########

data "aws_ami" "ubuntu" {
  most_recent      = true
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["Groot-startup-${var.custom_ami_version}"]
  }
}