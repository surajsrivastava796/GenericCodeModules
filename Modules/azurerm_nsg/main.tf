variable "nsgmap" {

}


resource "azurerm_network_security_group" "nsgblock" {
  for_each            = var.nsgmap
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  security_rule {
    name                       = "SSH-rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "80"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

   security_rule {
    name                       = "RDP-rule"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "3389"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}
