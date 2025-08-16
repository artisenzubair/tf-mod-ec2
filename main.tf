terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  # Backend configuration - Terragrunt will fill in the details
  backend "s3" {}
}

provider "aws" {
  region = "us-east-1"   # change if you want another region
}

resource "aws_instance" "demo" {
  ami           = "ami-08c40ec9ead489470" # Amazon Linux 2 AMI in us-east-1
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}


variable "instance_type" {}
variable "instance_name" {}