resource "random_id" "vm_id" {
  byte_length = 4
}

resource "null_resource" "virtual_machine" {
  # This is a mock resource as actual cloud provider resources require specific provider configuration.
  # In a real scenario, you would use resources like 'google_compute_instance', 'aws_instance', etc.
  # For demonstration, we use null_resource with a random ID.
  triggers = {
    id = random_id.vm_id.hex
  }

  provisioner "local-exec" {
    command = "echo 'Simulating creation of VM with ID: ${random_id.vm_id.hex}'"
  }
}