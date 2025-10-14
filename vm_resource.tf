resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1d0" # Amazon Linux 2 AMI
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}