resource "azurerm_resource_group" "storage" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "storage" {
  name                     = "storageaccountname"
  resource_group_name      = "${azurerm_resource_group.storage.name}"
  location                 = "${azurerm_resource_group.storage.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}