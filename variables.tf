# Declaração de variáveis para entrada de usuário no Terraform

variable "instance_name" {
  description = "Nome da instância"
  type        = string
  default     = "minha-instancia"
}

variable "instance_type" {
  description = "Tipo da instância (ex: t2.micro)"
  type        = string
  default     = "t2.micro"
}

variable "region" {
  description = "Região da AWS"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Ambiente (dev, staging, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "O ambiente deve ser 'dev', 'staging' ou 'prod'."
  }
}