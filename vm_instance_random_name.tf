# Terraform configuration for a virtual machine

terraform {
  required_providers {
    # Example provider - can be changed based on your cloud provider
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Define variables
variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
  default     = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI
}

# Virtual Machine resource (AWS EC2 instance example)
resource "aws_instance" "vm" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "terraform-vm"
  }

  # Optional: Add key pair for SSH access
  # key_name = "your-key-pair"

  # Optional: Add security group
  # vpc_security_group_ids = [aws_security_group.vm_sg.id]

  # Optional: User data script
  # user_data = <<-EOF
  #             #!/bin/bash
  #             echo "Hello, World" > index.html
  #             nohup python3 -m http.server 80 &
  #             EOF
}

# Optional: Security group for the VM
# resource "aws_security_group" "vm_sg" {
#   name        = "terraform-vm-sg"
#   description = "Security group for Terraform VM"

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.vm.id
}

output "public_ip" {
  description = "Public IP address of the instance"
  value       = aws_instance.vm.public_ip
}