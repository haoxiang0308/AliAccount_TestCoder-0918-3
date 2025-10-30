# Terraform module for creating a virtual network

# Define variables for the virtual network
variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "my-virtual-network"
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "default-subnet"
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the resources"
  type        = string
  default     = "East US"
}

# Create the virtual network
resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    Environment = "Development"
    Project     = "Terraform-Example"
  }
}

# Create a subnet within the virtual network
resource "azurerm_subnet" "main" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.subnet_address_prefixes
}

# Output the virtual network ID
output "vnet_id" {
  description = "ID of the created virtual network"
  value       = azurerm_virtual_network.main.id
}

# Output the subnet ID
output "subnet_id" {
  description = "ID of the created subnet"
  value       = azurerm_subnet.main.id
}

# Output the virtual network name
output "vnet_name" {
  description = "Name of the created virtual network"
  value       = azurerm_virtual_network.main.name
}