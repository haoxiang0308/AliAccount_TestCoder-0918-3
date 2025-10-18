# Terraform configuration for a virtual machine

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Define the virtual machine resource (AWS EC2 instance as an example)
resource "aws_instance" "vm" {
  ami           = "ami-0c02fb55956c7d316"  # Amazon Linux 2 AMI (us-east-1)
  instance_type = "t3.micro"
  
  tags = {
    Name = "my-vm-instance"
  }
  
  # Optional: Configure additional properties
  key_name = "my-key-pair"  # Replace with your key pair name
  
  vpc_security_group_ids = [
    "sg-12345678"  # Replace with your security group ID
  ]
  
  subnet_id = "subnet-12345678"  # Replace with your subnet ID
  
  # User data script to run on instance startup
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World!" > /home/ec2-user/hello.txt
              EOF
}

# Output the instance ID and public IP
output "instance_id" {
  value = aws_instance.vm.id
}

output "public_ip" {
  value = aws_instance.vm.public_ip
}