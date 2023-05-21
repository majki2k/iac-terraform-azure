provider "azurerm" {
  version = "=3.0.0"
}

resource "azurerm_resource_group" "test_resource_group" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "test_storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.test_resource_group.name
  location                 = azurerm_resource_group.test_resource_group.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_app_service_plan" "test_app_service_plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.test_resource_group.location
  resource_group_name = azurerm_resource_group.test_resource_group.name
  kind                = var.kind
  reserved            = var.reserved

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }
}

resource "azurerm_linux_function_app" "test_linux_function_app" {
  name                = var.function_app_name
  location            = azurerm_resource_group.test_resource_group.location
  resource_group_name = azurerm_resource_group.test_resource_group.name
  service_plan_id = azurerm_app_service_plan.test_app_service_plan.id
  storage_account_name = azurerm_storage_account.test_storage_account.name
  site_config {
    application_stack {
      python_version = "3.9"
    }
  }
}

resource "azurerm_function_app_function" "test_function_app_function" {
  name                = var.function_name
  function_app_id     = azurerm_linux_function_app.test_linux_function_app.id
   language        = "Python"
  test_data = jsonencode({
    "name" = "Azure"
  })
  config_json = jsonencode({
    "bindings" = [
      {
        "authLevel" = "function"
        "direction" = "in"
        "methods" = [
          "get",
          "post",
        ]
        "name" = "req"
        "type" = "httpTrigger"
      },
      {
        "direction" = "out"
        "name"      = "$return"
        "type"      = "http"


