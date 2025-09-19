terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "example_vm" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "ExampleVM"
  }
}