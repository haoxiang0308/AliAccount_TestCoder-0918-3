terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1" # Укажите нужный регион
  # Параметры аутентификации (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY) должны быть настроены в окружении
}

# Ресурс: виртуальная машина (EC2 instance)
resource "aws_instance" "my_vm" {
  ami           = "ami-0c55b159cbfafe1d0" # Amazon Linux 2 AMI (us-east-1) - пример, устаревает
  instance_type = "t2.micro" # Бесплатный тир в рамках AWS Free Tier

  tags = {
    Name = "MyTerraformVM"
  }
}