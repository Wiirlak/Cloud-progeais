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

locals {
  group_name = "Aquarius"
}

resource "azurerm_resource_group" "main" {
  name     = "group-${local.group_name}"
  location = "francecentral"
}

