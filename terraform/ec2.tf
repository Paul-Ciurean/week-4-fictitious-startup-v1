#######
# EC2 #
#######

resource "aws_instance" "ec2_instance" {
  ami = data.terraform_remote_state.source.outputs.vpc_id
  instance_type = "t2.micro"
  subnet_id = data.terraform_remote_state.source.outputs.public_subnet_ids[0]
  associate_public_ip_address = true

  tags = {
    Name = "Groot-Instance"
  }
}

##################
# Security Group #
##################

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic and all outbound traffic"
  vpc_id      = data.terraform_remote_state.source.outputs.vpc_id

  tags = {
    Name = "http"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.allow_http.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_http.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}