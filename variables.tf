variable "region" {
  description = "The AWS region"
  default     = "eu-central-1"
}

variable "ami" {
  description = "AMI of the EC2 instance"
  default = "ami-004359656ecac6a95"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}
