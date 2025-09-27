# Terraform configuration for a Virtual Machine

terraform {
  required_providers {
    # This example uses the 'null' provider for demonstration.
    # In a real scenario, you would use a specific cloud provider like 'aws', 'azurerm', etc.
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
}

# Data source to get the public IP of the current machine (example)
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

# Resource: A null resource representing a virtual machine conceptually
resource "null_resource" "virtual_machine" {
  # This triggers are just for demonstration of how a VM might react to changes
  triggers = {
    public_ip = data.http.myip.response_body
  }

  # Provisioner: Example of a local provisioner that runs locally after the resource is created
  provisioner "local-exec" {
    command = "echo 'Virtual machine simulation created with public IP: ${data.http.myip.response_body}' > vm_simulation.log"
  }
}

# Output: Print the simulated VM's public IP
output "simulated_vm_public_ip" {
  value = chomp(data.http.myip.response_body)
}