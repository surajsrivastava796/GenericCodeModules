data "azurerm_key_vault" "kv" {
  for_each            = var.sqlservermap
  name                = each.value.keyvault_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "vault_sql_username_data" {
  for_each     = var.sqlservermap
  name         = each.value.sql_username
  key_vault_id = data.azurerm_key_vault.kv[each.key].id

}

data "azurerm_key_vault_secret" "vault_sql_password_data" {
  for_each     = var.sqlservermap
  name         = each.value.sql_password
  key_vault_id = data.azurerm_key_vault.kv[each.key].id

}