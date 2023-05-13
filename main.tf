provider "aws" {
  region = var.region
}

resource "aws_instance" "openvpn_server" {
  ami           = var.ami
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.openvpn_sg.id]

  tags = {
    Name = "OpenVPN_Server"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum -y update
              sudo yum -y remove openvpn-as-yum
              sudo yum -y install https://as-repository.openvpn.net/as-repo-amzn2.rpm
              sudo yum -y install openvpn-as
              EOF

}

resource "aws_security_group" "openvpn_sg" {
  name = "openvpn_sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 943
    to_port     = 943
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1194
    to_port     = 1194
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "openvpn_sg"
  }
}

resource "aws_eip" "openvpn_eip" {
  vpc      = true
  instance = aws_instance.openvpn_server.id

  tags = {
    Name = "openvpn_eip"
  }
}
