// APP SERVICE PLAN
resource "azurerm_app_service_plan" "front" {
  name                = "${var.prefix}-front-appserviceplan"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  sku {
    tier = "Standard" //la FunctionApp a besoin de Dynamic
    size = "S1" //la FunctionApp a besoin de Y14
  }
}

// APP SERVICE
resource "azurerm_app_service" "front" {
  name                = "${var.prefix}-front-app-service"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  app_service_plan_id = azurerm_app_service_plan.front.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "ExternalGit"
  }

  source_control {
    repo_url = "https://github.com/ZineddineBoudaoud/cloudfront"
    branch   = "master"  
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "Database"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}

// CONTAINER
resource "azurerm_container_registry" "main" {
  name                     = "${var.prefix}Container"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  sku                      = "Premium"
  admin_enabled            = false
  georeplication_locations = ["East US", "West Europe"]
}
