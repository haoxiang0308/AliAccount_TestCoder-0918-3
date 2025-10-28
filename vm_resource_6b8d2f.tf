# Terraform configuration for a virtual machine

terraform {
  required_providers {
    # Example provider - in real usage you would specify the cloud provider
    # like aws, azurerm, google, etc.
  }
}

# Example virtual machine resource (using a generic example)
# In practice, you would replace this with the specific provider's VM resource
resource "null_resource" "virtual_machine" {
  # This is a placeholder - would be replaced with actual VM resource
  # like aws_instance, azurerm_virtual_machine, google_compute_instance, etc.
  triggers = {
    always_run = "${timestamp()}"
  }

  connection {
    # Configuration for provisioning the VM would go here
  }
}

# Example with AWS provider (commented out as example)
/*
resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1d0"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  
  tags = {
    Name = "WebServer"
  }
}
*/

# Example with Azure provider (commented out as example)
/*
resource "azurerm_virtual_machine" "main" {
  name                  = "my-vm"
  location              = "East US"
  resource_group_name   = "my-resource-group"
  vm_size               = "Standard_B1s"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "my-vm"
    admin_username = "adminuser"
  }

  os_profile_linux_config {
    disable_password_authentication = true
  }
}
*/