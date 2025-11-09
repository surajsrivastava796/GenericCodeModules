variable "sqlservermap" {
  
}

resource "azurerm_mssql_server" "mssqlserverblock" {
  for_each = var.sqlservermap
  name                         = each.value.sql_server_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.vault_sql_username_data[each.key].value
  administrator_login_password = data.azurerm_key_vault_secret.vault_sql_password_data[each.key].value
  minimum_tls_version          = "1.2"
}