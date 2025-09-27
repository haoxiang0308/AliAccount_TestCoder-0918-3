# Переменная в HCL с типом строка, сохраненная в файл со случайным именем

variable "my_string_variable" {
  type        = string
  default     = "Это строковая переменная в HCL"
  description = "Пример переменной типа string"
}