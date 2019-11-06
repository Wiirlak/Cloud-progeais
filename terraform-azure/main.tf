
terraform {
  required_version = ">= 0.12.0"
  required_providers {
    azurerm = ">=1.30.0"
  }
}

provider "azurerm" {
  version = ">=1.30.0"

  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}

resource "azurerm_resource_group" "test" {
  name     = "${var.group}-esgi-al"
  location = "francecentral"
}

resource "azurerm_storage_account" "test" {
  name                     = "esgi${var.group}"
  resource_group_name      = azurerm_resource_group.test.name
  location                 = azurerm_resource_group.test.location
  account_tier             = "Standard"
  account_replication_type = "RAGRS"

  tags = {
    environment = "dev"
    group       = var.group
  }
}
