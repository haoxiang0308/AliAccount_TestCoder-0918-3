resource "random_id" "vm_id" {
  byte_length = 4
}

resource "null_resource" "virtual_machine" {
  # This is a mock resource simulating a VM
  triggers = {
    vm_id = random_id.vm_id.hex
  }

  provisioner "local-exec" {
    command = "echo 'Simulating creation of VM with ID ${self.triggers.vm_id}' > /tmp/terraform_vm_${self.triggers.vm_id}.log"
  }
}