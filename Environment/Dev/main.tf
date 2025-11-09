module "resourcegrp" {
  source = "../../Modules/azurerm_resource_group"
  rgmap  = var.rgmap
}


module "vnet" {
  depends_on = [module.resourcegrp]
  source     = "../../Modules/azurerm_virtual_network"
  vmap       = var.vmap
}

module "stgacc" {
  depends_on = [module.resourcegrp]
  source     = "../../Modules/azurerm_storage_account"
  stgmap     = var.stgmap

}

module "subnetacc" {
  depends_on = [module.vnet]
  source     = "../../Modules/azurerm_subnet"
  subnetmap  = var.subnetmap
}

module "stgcontainer" {
  depends_on = [module.stgacc]
  source     = "../../Modules/azurerm_storage_container"
  stgcontmap = var.stgcontmap
}

module "pip" {
  depends_on = [module.resourcegrp]
  source     = "../../Modules/azurerm_public_ip"
  pipmap     = var.pipmap
}


module "bastion" {
  depends_on = [module.pip, module.subnetacc]
  source     = "../../Modules/azurerm_bastion"
  bastionmap = var.bastionmap
}


module "nic" {
  depends_on = [module.subnetacc]
  source     = "../../Modules/azurerm_nic"
  nicmap     = var.nicmap
}

module "nsg" {
  depends_on = [module.resourcegrp]
  source     = "../../Modules/azurerm_nsg"
  nsgmap     = var.nsgmap
}

module "nsgassociation" {
  depends_on        = [module.subnetacc, module.resourcegrp]
  source            = "../../Modules/azurerm_nsg_assocation"
  nsgassociationmap = var.nsgassociationmap
}

module "keyvault" {
  depends_on  = [module.resourcegrp]
  source      = "../../Modules/azurerm_keyvault"
  keyvaultmap = var.keyvaultmap
}

module "vm" {
  depends_on = [module.resourcegrp, module.subnetacc]
  source     = "../../Modules/azurerm_virtual_machine"
  vmmap      = var.vmmap
}

module "mssqlserver" {
  depends_on   = [module.resourcegrp, module.keyvault]
  source       = "../../Modules/azurerm_sql_server"
  sqlservermap = var.sqlservermap
}

module "mssqldatabase" {
  depends_on = [module.resourcegrp, module.mssqlserver]
  source     = "../../Modules/azurerm_sql_database"
  sqldbmap   = var.sqldbmap
}

module "containerregistry" {
  depends_on      = [module.resourcegrp]
  source          = "../../Modules/azurerm_container_registry"
  contregistrymap = var.contregistrymap
}

module "akscluster" {
  depends_on = [module.resourcegrp]
  source     = "../../Modules/azurerm_kubernetes_cluster"
  aksmap     = var.aksmap
}

module "policyassigent" {
  depends_on   = [module.akscluster, module.containerregistry, module.resourcegrp]
  source       = "../../Modules/azurerm_registry_kuber_link"
  akspolicymap = var.akspolicymap
}

module "loadbalancer" {
  depends_on = [module.resourcegrp, module.pip]
  source     = "../../Modules/azurerm_loadbalancer"
  loadbalmap = var.loadbalmap
}

module "loadbalancerbackend" {
  depends_on       = [module.resourcegrp, module.loadbalancer]
  source           = "../../Modules/azurerm_loadbalancer_backend"
  lbbackendpoolmap = var.lbbackendpoolmap
}

# module "loadbalancerbackendnicassociation" {
#   depends_on       = [module.resourcegrp, module.loadbalancer, module.loadbalancerbackend]
#   source           = "../../Modules/azurerm_loadbalance_backend_nic_association"
#   lbnicbackendasso = var.lbnicbackendasso
# }