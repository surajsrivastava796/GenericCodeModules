variable "nicmap" {
}

resource "azurerm_network_interface" "nicblock" {
  for_each = var.nicmap
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = each.value.config_name
    subnet_id                     = data.azurerm_subnet.subnetdata[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}
