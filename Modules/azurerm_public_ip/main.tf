variable "pipmap" {
  
}

resource "azurerm_public_ip" "pipblock" {
  for_each = var.pipmap
  name = each.value.pip_name
  resource_group_name = each.value.rg_name
  allocation_method = each.value.allocation_method
  location = each.value.location
}