variable "vmap" {
}

resource "azurerm_virtual_network" "vnet" {
  for_each = var.vmap
  name = each.value.vnet_name
  resource_group_name = each.value.rgname
  location = each.value.location
  address_space = each.value.address_space
}