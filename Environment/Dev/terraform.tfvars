rgmap = {
  rg1 = {
    name     = "suraj-dev-rg1"
    location = "koreacentral"
  }
  rg2 = {
    name     = "suraj-dev-rg2"
    location = "koreacentral"
  }
}

vmap = {
  v1 = {
    vnet_name     = "suraj-dev-vnet1"
    rgname        = "suraj-dev-rg1"
    location      = "koreacentral"
    address_space = ["10.0.0.0/16"]
  }
}


stgmap = {
  stg1 = {
    stg_name                 = "surajdevstg"
    rg_name                  = "suraj-dev-rg1"
    location                 = "koreacentral"
    account_replication_type = "LRS"
    acc_tier                 = "Standard"
  }
}


subnetmap = {
  s1 = {
    subnet_name      = "suraj-dev-frontendsubnet"
    rg_name          = "suraj-dev-rg1"
    vnet_name        = "suraj-dev-vnet1"
    location         = "koreacentral"
    address_prefixes = ["10.0.1.0/24"]
  }

  s2 = {
    subnet_name      = "suraj-dev-backendsubnet"
    rg_name          = "suraj-dev-rg1"
    vnet_name        = "suraj-dev-vnet1"
    location         = "koreacentral"
    address_prefixes = ["10.0.2.0/24"]
  }

  s3 = {
    subnet_name      = "AzureBastionSubnet"
    rg_name          = "suraj-dev-rg1"
    location         = "koreacentral"
    vnet_name        = "suraj-dev-vnet1"
    address_prefixes = ["10.0.3.0/24"]
  }

}

stgcontmap = {
  cont1 = {
    cont_name             = "devcontainer"
    container_access_type = "container"
    stg_name              = "surajdevstg"
    rg_name               = "suraj-dev-rg1"
  }
}

pipmap = {
  pip1 = {
    pip_name          = "suraj-dev-publicip"
    rg_name           = "suraj-dev-rg1"
    location          = "koreacentral"
    allocation_method = "Static"
  }
  pip2 = {
    pip_name          = "loadbalancerpip"
    rg_name           = "suraj-dev-rg1"
    location          = "koreacentral"
    allocation_method = "Static"
  }
}


bastionmap = {
  bast = {
    bastion_name      = "suraj-dev-bastion"
    rg_name           = "suraj-dev-rg1"
    subnet_name       = "AzureBastionSubnet"
    vnet_name         = "suraj-dev-vnet1"
    location          = "koreacentral"
    allocation_method = "Static"
    pip_name          = "suraj-dev-publicip"
  }
}


nicmap = {
  nic1 = {
    nic_name                      = "suraj-dev-nic1"
    location                      = "koreacentral"
    rg_name                       = "suraj-dev-rg1"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "suraj-dev-frontendsubnet"
    vnet_name                     = "suraj-dev-vnet1"
    config_name                   = "configrule1"
  }
  nic2 = {
    nic_name                      = "suraj-dev-nic2"
    location                      = "koreacentral"
    rg_name                       = "suraj-dev-rg1"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "suraj-dev-backendsubnet"
    vnet_name                     = "suraj-dev-vnet1"
    config_name                   = "configrule2"
  }
}


nsgmap = {
  nsg1 = {
    nsg_name = "suraj-dev-frontend-nsg"
    rg_name  = "suraj-dev-rg1"
    location = "koreacentral"
  }

  nsg2 = {
    nsg_name = "suraj-dev-backend-nsg"
    rg_name  = "suraj-dev-rg1"
    location = "koreacentral"
  }
}


nsgassociationmap = {
  nsgasso1 = {
    nsg_name    = "suraj-dev-frontend-nsg"
    rg_name     = "suraj-dev-rg1"
    subnet_name = "suraj-dev-frontendsubnet"
    vnet_name   = "suraj-dev-vnet1"
  }

  nsgasso2 = {
    nsg_name    = "suraj-dev-backend-nsg"
    rg_name     = "suraj-dev-rg1"
    subnet_name = "suraj-dev-backendsubnet"
    vnet_name   = "suraj-dev-vnet1"
  }
}

keyvaultmap = {
  kv1 = {
    name                        = "surajgenericdevkeyvault2"
    rg_name                     = "suraj-dev-rg1"
    location                    = "koreacentral"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    sku_name                    = "standard"

  }
}
vmmap = {
  vm1 = {
    vm_name                         = "suraj-frontend-vm"
    rg_name                         = "suraj-dev-rg1"
    location                        = "koreacentral"
    size                            = "Standard_B1s"
    disable_password_authentication = false
    nic_name                        = "suraj-dev-nic1"
    keyvault_password               = "password"
    keyvault_username               = "username"
    keyvault_name                   = "surajgenericdevkeyvault2"
    osdisk_name                     = "surajdevosdisk3"
  }
  vm2 = {
    vm_name                         = "suraj-backend-vm"
    rg_name                         = "suraj-dev-rg1"
    location                        = "koreacentral"
    size                            = "Standard_B1s"
    disable_password_authentication = false
    nic_name                        = "suraj-dev-nic2"
    keyvault_password               = "password"
    keyvault_username               = "username"
    keyvault_name                   = "surajgenericdevkeyvault2"
    osdisk_name                     = "surajdevosdisk4"


  }

}


sqlservermap = {
  sql1 = {
    sql_server_name = "suraj-dev-sqlserver"
    rg_name         = "suraj-dev-rg1"
    location        = "koreacentral"
    keyvault_name   = "surajgenericdevkeyvault2"
    sql_username    = "sqlusername"
    sql_password    = "sqlpwd"
  }
}

sqldbmap = {
  db1 = {
    sql_server_name = "suraj-dev-sqlserver"
    rg_name         = "suraj-dev-rg1"
    sql_db_name     = "suraj-dev-sqldatabase"
    collation       = "SQL_Latin1_General_CP1_CI_AS"
    license_type    = "LicenseIncluded"
    max_size_gb     = 2
    sku_name        = "S0"
    enclave_type    = "VBS"
  }
}

contregistrymap = {
  reg1 = {
    registry_name = "surajdevimageregistry"
    rg_name       = "suraj-dev-rg1"
    location      = "koreacentral"
    sku           = "Premium"
  }
}

aksmap = {
  aks1 = {
    aks_name   = "suraj-dev-aks"
    location   = "koreacentral"
    rg_name    = "suraj-dev-rg1"
    dns_prefix = "surajaks"
  }
}


akspolicymap = {
  p1 = {
    aks_name      = "suraj-dev-aks"
    registry_name = "surajdevimageregistry"
    rg_name       = "suraj-dev-rg1"
  }
}

loadbalmap = {
  lb1 = {
    lb_name  = "suraj-dev-lb"
    location = "koreacentral"
    rg_name  = "suraj-dev-rg1"
    pip_name = "loadbalancerpip"
  }
}

lbbackendpoolmap = {
  bp1 = {
    lb_name   = "suraj-dev-lb"
    location  = "koreacentral"
    rg_name   = "suraj-dev-rg1"
    bp_name   = "suraj-dev-lb-backendPool"
    vnet_name = "suraj-dev-vnet1"
  }
}

lbnicbackendasso = {
  lbassoc1 = {
    rg_name               = "suraj-dev-rg1"
    bp_name               = "suraj-dev-lb-backendPool"
    lb_name               = "suraj-dev-lb"
    nic_name              = "suraj-dev-nic1"
    ip_configuration_name = "configrule1"
  }
  lbassoc2 = {
    rg_name               = "suraj-dev-rg1"
    bp_name               = "suraj-dev-lb-backendPool"
    lb_name               = "suraj-dev-lb"
    nic_name              = "suraj-dev-nic2"
    ip_configuration_name = "configrule2"
  }
}