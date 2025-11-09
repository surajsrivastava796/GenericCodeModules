variable "akspolicymap" {

}

resource "azurerm_role_assignment" "assignmentblock" {
  for_each = data.azurerm_kubernetes_cluster.dataaks

  principal_id                     = each.value.kubelet_identity[0].object_id
  scope                            = data.azurerm_container_registry.dataregistry[each.key].id
  skip_service_principal_aad_check = true
  role_definition_name             = "AcrPull"
}
