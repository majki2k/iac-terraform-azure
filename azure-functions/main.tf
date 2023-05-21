provider "azurerm" {
  version = "=3.0.0"
}

resource "azurerm_resource_group" "test_resource_group" {
  name     = "test-resource-group"
  location = "West Europe"
}

resource "azurerm_storage_account" "test_storage_account" {
  name                     = "teststorageaccount"
  resource_group_name      = azurerm_resource_group.test_resource_group.name
  location                 = azurerm_resource_group.test_resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "test_app_service_plan" {
  name                = "test-app-service-plan"
  location            = azurerm_resource_group.test_resource_group.location
  resource_group_name = azurerm_resource_group.test_resource_group.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_linux_function_app" "test_linux_function_app" {
  name                = "test-linux-function-app"
  location            = azurerm_resource_group.test_resource_group.location
  resource_group_name = azurerm_resource_group.test_resource_group.name
  app_service_plan_id = azurerm_app_service_plan.test_app_service_plan.id
  storage_account_name = azurerm_storage_account.test_storage_account.name
}

resource "azurerm_function_app_function" "test_function_app_function" {
  name                = "test-function"
  resource_group_name = azurerm_resource_group.test_resource_group.name
  function_app_id     = azurerm_linux_function_app.test_linux_function_app.id
  storage_account_name = azurerm_storage_account.test_storage_account.name

  triggers = {
    timer = {
      schedule = "0 */5 * * * *"
    }
  }

  app_settings = {
    key1 = "value1"
    key2 = "value2"
  }
}

