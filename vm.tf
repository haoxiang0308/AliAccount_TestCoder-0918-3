resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1d0" # Amazon Linux 2 AMI ID for us-west-2 region
  instance_type = "t3.micro"

  tags = {
    Name = "WebServerInstance"
  }
}