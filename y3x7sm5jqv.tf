# Terraform configuration for a virtual machine

terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# Virtual Machine (EC2 Instance)
resource "aws_instance" "vm" {
  ami           = var.ami_id
  instance_type = var.instance_type

  key_name = var.key_name

  vpc_security_group_ids = [aws_security_group.vm_sg.id]

  tags = {
    Name = var.vm_name
  }

  # Optional: User data script to run on instance startup
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World! This is our virtual machine."
              EOF
}

# Security Group for the VM
resource "aws_security_group" "vm_sg" {
  name        = "${var.vm_name}-sg"
  description = "Security group for virtual machine"

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
}

# Variables
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "ID of the AMI to use for the instance"
  type        = string
  default     = "ami-0c02fb55956c7d316"  # Amazon Linux 2
}

variable "instance_type" {
  description = "Type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = "my-key-pair"
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
  default     = "my-vm"
}

# Output the VM details
output "vm_public_ip" {
  value       = aws_instance.vm.public_ip
  description = "Public IP address of the virtual machine"
}

output "vm_private_ip" {
  value       = aws_instance.vm.private_ip
  description = "Private IP address of the virtual machine"
}

output "vm_id" {
  value       = aws_instance.vm.id
  description = "ID of the virtual machine"
}