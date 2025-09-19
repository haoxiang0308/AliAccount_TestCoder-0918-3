variable "instance_type" {
  description = "Тип EC2 инстанса"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "ID AMI для EC2 инстанса"
  type        = string
  default     = "ami-0c55b159cbfafe1d0"
}

variable "region" {
  description = "Регион AWS"
  type        = string
  default     = "us-west-2"
}