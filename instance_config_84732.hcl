variable "instance_type" {
  description = "The EC2 instance type to use for the server"
  type        = string
  default     = "t3.micro"
  
  validation {
    condition     = length(var.instance_type) > 0
    error_message = "Instance type must be a non-empty string."
  }
}