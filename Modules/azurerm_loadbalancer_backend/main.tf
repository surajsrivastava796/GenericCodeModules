variable "lbbackendpoolmap" {
  
}


resource "azurerm_lb_backend_address_pool" "lbbackendpoolblock" {
  for_each = var.lbbackendpoolmap
  loadbalancer_id = data.azurerm_lb.datalb[each.key].id
  name            = each.value.bp_name
  virtual_network_id = data.azurerm_virtual_network.datavnet[each.key].id
}