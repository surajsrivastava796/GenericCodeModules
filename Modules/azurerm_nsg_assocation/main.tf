variable "nsgassociationmap" {
  
}

resource "azurerm_subnet_network_security_group_association" "nsgassocationblock" {
  for_each = var.nsgassociationmap
  subnet_id                 = data.azurerm_subnet.data_subnet[each.key].id
  network_security_group_id = data.azurerm_network_security_group.data_nsg[each.key].id
}