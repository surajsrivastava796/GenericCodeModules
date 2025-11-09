variable "stgmap" {

}


resource "azurerm_storage_account" "storageacc" {
  for_each                 = var.stgmap
  name                     = each.value.stg_name
  resource_group_name      = each.value.rg_name
  location                 = each.value.location
  account_replication_type = each.value.account_replication_type
  account_tier             = each.value.acc_tier
}
