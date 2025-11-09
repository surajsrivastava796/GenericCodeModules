data "azurerm_lb" "datalb" {
  for_each = var.lbbackendpoolmap
  name                = each.value.lb_name
  resource_group_name = each.value.rg_name
}

data "azurerm_virtual_network" "datavnet" {
  for_each = var.lbbackendpoolmap
  name                = each.value.vnet_name
  resource_group_name = each.value.rg_name
}