# Define required providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Example resource that would have a public IP (commented out since we need actual cloud setup)
/*
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1d0"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  
  tags = {
    Name = "example-instance"
  }
}
*/

# Define output for public IP (using a data source as example since we don't have actual resources)
# In a real scenario, this would reference an actual resource's public IP
output "public_ip" {
  description = "Public IP address"
  # Using a data source to simulate getting a public IP
  value = var.public_ip_value != "" ? var.public_ip_value : "simulate_public_ip"
  sensitive = false
}

# Data source to get public IP of current instance (alternative approach)
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

output "my_public_ip" {
  description = "My current public IP"
  value = chomp(data.http.myip.response_body)
  sensitive = false
}