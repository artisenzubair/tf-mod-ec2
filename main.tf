terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  


resource "aws_instance" "demo" {
  ami           = var.ami_id # Amazon Linux 2 AMI in us-east-1
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}


variable "instance_type" {}
variable "instance_name" {}
variable "ami_id"        { type = string }
variable "region"        { type = string }


output "instance_id" {
  value = aws_instance.demo.id
}