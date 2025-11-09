data "azurerm_key_vault" "kv" {
  for_each            = var.vmmap
  name                = each.value.keyvault_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "vault_username_data" {
  for_each     = var.vmmap
  name         = each.value.keyvault_username
  key_vault_id = data.azurerm_key_vault.kv[each.key].id

}

data "azurerm_key_vault_secret" "vault_password_data" {
  for_each     = var.vmmap
  name         = each.value.keyvault_password
  key_vault_id = data.azurerm_key_vault.kv[each.key].id

}


data "azurerm_network_interface" "nicvalue" {
  for_each            = var.vmmap
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}