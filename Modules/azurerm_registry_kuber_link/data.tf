data "azurerm_kubernetes_cluster" "dataaks" {
  for_each            = var.akspolicymap
  name                = each.value.aks_name
  resource_group_name = each.value.rg_name
}

data "azurerm_container_registry" "dataregistry" {
  for_each            = var.akspolicymap
  name                = each.value.registry_name
  resource_group_name = each.value.rg_name
}
