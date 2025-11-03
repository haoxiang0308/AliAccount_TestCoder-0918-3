# Variáveis para entrada de usuário em Terraform

variable "instance_name" {
  description = "Nome da instância"
  type        = string
  default     = "instancia-padrao"
}

variable "instance_type" {
  description = "Tipo da instância"
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

variable "tags" {
  description = "Tags para os recursos"
  type        = map(string)
  default = {
    Owner = "usuario"
    Project = "projeto-exemplo"
  }
}