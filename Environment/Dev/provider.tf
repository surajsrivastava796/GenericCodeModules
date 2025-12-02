terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.50.0"
    }
}
}

provider "azurerm" {
  features {

  }
  subscription_id = "265d5c6a-c357-4ca8-a7dd-4a8bf8964a38"
}