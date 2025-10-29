# Terraform configuration for a virtual machine

terraform {
  required_providers {
    # Example provider - you would use the appropriate provider for your cloud
    # For example: aws, azurerm, google, etc.
  }
}

# Example VM resource using a generic approach
# This example uses aws_instance, but you can adapt for your cloud provider
resource "aws_instance" "example_vm" {
  ami           = "ami-0c55b159cbfafe1d0"  # Amazon Linux 2 AMI (us-east-1)
  instance_type = "t2.micro"
  
  tags = {
    Name = "example-vm"
  }
  
  # Optional: Add key pair for SSH access
  # key_name = "your-key-pair"
  
  # Optional: Configure security group
  # vpc_security_group_ids = [aws_security_group.vm_sg.id]
}

# Optional: Security group for the VM
/*
resource "aws_security_group" "vm_sg" {
  name_prefix = "vm-sg-"
  
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
*/