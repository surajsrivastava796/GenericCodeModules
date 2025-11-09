variable "vmmap" {

}

resource "azurerm_linux_virtual_machine" "vmblock" {
  for_each                        = var.vmmap
  name                            = each.value.vm_name
  admin_username                  = data.azurerm_key_vault_secret.vault_username_data[each.key].value
  admin_password                  = data.azurerm_key_vault_secret.vault_password_data[each.key].value
  resource_group_name             = each.value.rg_name
  location                        = each.value.location
  size                            = each.value.size
  disable_password_authentication = each.value.disable_password_authentication
  network_interface_ids           = [data.azurerm_network_interface.nicvalue[each.key].id]

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  os_disk {
    name    = each.value.osdisk_name
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }


}
