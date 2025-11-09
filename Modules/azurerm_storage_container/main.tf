variable "stgcontmap" {
}

resource "azurerm_storage_container" "stgcontainer" {
  for_each              = var.stgcontmap
  name                  = each.value.cont_name
  storage_account_id    = data.azurerm_storage_account.stgdataacc[each.key].id
  container_access_type = each.value.container_access_type

}