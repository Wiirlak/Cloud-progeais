resource "azurerm_function_app" "main" {
  name                      = "function-app-aquarius"
  location                  = azurerm_resource_group.main.location
  resource_group_name       = azurerm_resource_group.main.name
  app_service_plan_id       = azurerm_app_service_plan.front.id
  storage_connection_string = azurerm_storage_account.storage.primary_connection_string

  source_control {
    repo_url = "https://github.com/ZineddineBoudaoud/Fonction-Serverless"
    branch = "master"
  }
}
