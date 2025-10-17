# Terraform configuration for a virtual machine

terraform {
  required_providers {
    # Example using a common provider like AWS
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Define a virtual machine resource (example using AWS EC2 instance)
resource "aws_instance" "example_vm" {
  ami           = "ami-0c55b159cbfafe1d0"  # Amazon Linux 2 AMI (us-east-1)
  instance_type = "t2.micro"                # Free tier eligible instance type

  tags = {
    Name = "example-vm"
  }
}