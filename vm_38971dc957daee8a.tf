# Terraform configuration for a virtual machine
terraform {
  required_providers {
    # Example provider - you would specify the actual provider you're using
    # such as aws, azure, google, etc.
  }
}

# Example virtual machine resource (AWS EC2 instance)
resource "aws_instance" "example_vm" {
  ami           = "ami-0c55b159cbfafe1d0" # Amazon Linux 2 AMI (us-east-1)
  instance_type = "t2.micro"
  
  tags = {
    Name = "example-vm"
  }
}

# You can customize this configuration based on your cloud provider
# For example, for Azure you would use azurerm_virtual_machine
# For Google Cloud you would use google_compute_instance
