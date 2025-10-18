resource "aws_instance" "example_vm" {
  ami           = "ami-0c55b159cbfafe1d0"  # Amazon Linux 2 AMI (us-east-1) - пример
  instance_type = "t2.micro"               # Бесплатный тир в AWS

  tags = {
    Name = "ExampleVM"
  }
}