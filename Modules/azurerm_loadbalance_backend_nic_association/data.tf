data "azurerm_network_interface" "datanic" {
  for_each            = var.lbnicbackendasso
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}

data "azurerm_lb" "datalb" {
  for_each            = var.lbnicbackendasso
  name                = each.value.lb_name
  resource_group_name = each.value.rg_name
}

data "azurerm_lb_backend_address_pool" "databp" {
  for_each            = var.lbnicbackendasso
  name            = each.value.bp_name
  loadbalancer_id = data.azurerm_lb.datalb[each.key].id
}