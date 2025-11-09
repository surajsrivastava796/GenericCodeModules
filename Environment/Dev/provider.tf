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
  subscription_id = "3c5a5847-bba8-4a7e-b700-87684df57784"
}