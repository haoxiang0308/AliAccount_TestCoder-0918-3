resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-vm"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  size                = "Standard_B1s"
  admin_username      = "adminuser"

  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQzJYm6hi5uZB2d76TO/nZo3J9DxZ03t0YbEBcQ2JSSS5pTZkBzPcDjBWmZXykOzMZxtu6XQ/SvY6Iy9Jd3Hk9oKIK3E+HQz0JE0IaQj684rl8xRLoEs0Kl9JrQmH7AZ46RGUO8N0P8i0J8D8K2m6WjbvS0dSnAz1PjXG1r9nZ7B8K4t+q9zBfEPFpdKh80aGUfqXmUb1iwYmgnqVbC7k0RvG6d4DRrH5QV6VqH+9+5xzLlO5ZQf7/5OrzFqkFhoI1rOLhwRfKZzoE4zWV6SkvX9lQuoEhV0YF6u4fPKIhH3OG/NxJ7Ttjf1q5o15z5L8E3 example"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
}