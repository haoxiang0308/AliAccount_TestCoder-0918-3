# Провайдер AWS
provider "aws" {
  region = "us-west-2"
}

# Ресурс виртуальной машины (EC2 инстанс)
resource "aws_instance" "example_vm" {
  # AMI для Amazon Linux 2
  ami           = "ami-0abcdef1234567890"
  # Тип инстанса
  instance_type = "t3.micro"
  
  # Ключевая пара для SSH доступа
  key_name = "my-key-pair"
  
  # Группа безопасности
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  
  # Теги
  tags = {
    Name = "Example-VM"
  }
}

# Группа безопасности для доступа по SSH
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH access"
  
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