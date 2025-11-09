data "azurerm_mssql_server" "sqlserverdata" {
  for_each            = var.sqldbmap
  name                = each.value.sql_server_name
  resource_group_name = each.value.rg_name
}
