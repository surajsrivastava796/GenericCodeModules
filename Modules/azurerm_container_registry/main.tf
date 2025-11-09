variable "contregistrymap" {

}


resource "azurerm_container_registry" "containerregistryblock" {
  for_each            = var.contregistrymap
  name                = each.value.registry_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  sku                 = each.value.sku
}
