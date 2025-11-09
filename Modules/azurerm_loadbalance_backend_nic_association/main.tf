variable "lbnicbackendasso" {

}

resource "azurerm_network_interface_backend_address_pool_association" "example" {
  for_each                = var.lbnicbackendasso
  network_interface_id    = data.azurerm_network_interface.datanic[each.key].id
  ip_configuration_name   = each.value.ip_configuration_name
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.databp[each.key].id
}
