resource "azurerm_function_app" "main" {
  name                      = "function-app-aquarius"
  location                  = "${azurerm_resource_group.main.location}"
  resource_group_name       = "${azurerm_resource_group.main.name}"
  app_service_plan_id       = "${azurerm_app_service_plan.main.id}"
  storage_connection_string = "${azurerm_storage_account.default.primary_connection_string}"
}