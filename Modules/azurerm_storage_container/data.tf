data "azurerm_storage_account" "stgdataacc" {
  for_each            = var.stgcontmap
  name                = each.value.stg_name
  resource_group_name = each.value.rg_name
}