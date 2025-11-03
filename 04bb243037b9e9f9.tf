# Terraform configuration for a virtual machine

# Define the AWS provider
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
  description = "The AMI to use for the instance"
  type        = string
  default     = "ami-0c55b159cbfafe1d0"  # Amazon Linux 2 AMI
}

# Virtual Machine Resource
resource "aws_instance" "vm" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "terraform-vm"
  }

  # Optional: Configure key pair for SSH access
  # key_name = "your-key-pair"

  # Optional: Configure security group
  # vpc_security_group_ids = [aws_security_group.vm_sg.id]
}

# Output the instance ID
output "instance_id" {
  description = "ID of the created instance"
  value       = aws_instance.vm.id
}

# Output the public IP
output "public_ip" {
  description = "Public IP of the instance"
  value       = aws_instance.vm.public_ip
}