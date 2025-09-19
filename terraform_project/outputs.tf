output "instance_id" {
  description = "ID созданного EC2 инстанса"
  value       = aws_instance.example_vm.id
}

output "instance_public_ip" {
  description = "Публичный IP адрес EC2 инстанса"
  value       = aws_instance.example_vm.public_ip
}