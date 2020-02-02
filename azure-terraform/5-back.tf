resource "azurerm_app_service_plan" "back" {
  name                = "${prefix}-back-appserviceplan"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "back" {
  name                = "${prefix}-back-app-service"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"
  app_service_plan_id = "${azurerm_app_service_plan.back.id}"

  site_config {
    dotnet_framework_version = "v3.1"
    scm_type                 = "LocalGit"
  }
}