resource "null_resource" "virtual_machine" {
  # This is a placeholder resource.
  # In a real scenario, this would be a specific cloud resource like
  # 'azurerm_virtual_machine' or 'google_compute_instance'.
  triggers = {
    always_run = "${timestamp()}"
  }
}