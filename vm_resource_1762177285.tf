# Terraform configuration for a virtual machine

resource "aws_instance" "example_vm" {
  ami           = "ami-0c02fb55956c7d316"  # Amazon Linux 2 AMI (us-east-1)
  instance_type = "t2.micro"
  
  tags = {
    Name = "example-vm"
  }
}

# Optional: Define variables for flexibility
variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "ID of the AMI to use for the instance"
  type        = string
  default     = "ami-0c02fb55956c7d316"
}

# Using variables in the resource
resource "aws_instance" "configurable_vm" {
  ami           = var.ami_id
  instance_type = var.instance_type
  
  tags = {
    Name = "configurable-vm"
  }
}