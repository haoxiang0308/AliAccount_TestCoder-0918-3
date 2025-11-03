# Terraform configuration for a virtual machine

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Define variables
variable "instance_type" {
  description = "The type of instance to provision"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = "ami-0c55b159cbfafe1d0"  # Amazon Linux 2 AMI
}

variable "key_name" {
  description = "Name of the SSH key pair to use"
  type        = string
  default     = "my-key-pair"
}

# Data source to get latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Virtual Machine Resource
resource "aws_instance" "vm_instance" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  key_name               = var.key_name

  tags = {
    Name = "terraform-vm"
  }
}

# Output the public IP of the instance
output "instance_public_ip" {
  description = "Public IP address of the VM instance"
  value       = aws_instance.vm_instance.public_ip
}

output "instance_id" {
  description = "ID of the VM instance"
  value       = aws_instance.vm_instance.id
}