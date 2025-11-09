variable "loadbalmap" {
  
}

resource "azurerm_lb" "loadbalancerblock" {
    for_each = var.loadbalmap
  name                = each.value.lb_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.data_pip[each.key].id
  }
}