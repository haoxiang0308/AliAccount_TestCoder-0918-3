/*
* Random VM resource
*/
resource "aws_instance" "vm" {
  ami           = "ami-0c55b159cbfafe1d0" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "random-vm-from-tf"
  }
}