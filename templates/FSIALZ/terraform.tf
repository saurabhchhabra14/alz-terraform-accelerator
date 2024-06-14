terraform {
  required_version = "~> 1.6"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.88"
    }
    alz = {
      source  = "azure/alz"
      version = "~> 0.11"
    }
  }
  backend "local" {}
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias           = "management"
  subscription_id = var.subscription_id_management
  features {}
}

provider "azurerm" {
  alias           = "connectivity"
  subscription_id = var.subscription_id_connectivity
  features {}
}
provider "alz" {
  lib_urls = ["${path.root}/archetypes"]
}
