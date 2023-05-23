resource "azurerm_resource_group" "test" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "test" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.test.name
  location                 = azurerm_resource_group.test.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}

resource "azurerm_app_service_plan" "test" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
  kind                = var.kind
  reserved            = var.reserved

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }
}

resource "azurerm_linux_function_app" "test" {
  name                = var.function_app_name
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
  service_plan_id = azurerm_app_service_plan.test.id
  storage_account_name = azurerm_storage_account.test.name
  site_config {
    application_stack {
      python_version = var.python_version
    }
  }
}

resource "azurerm_function_app_function" "test" {
  name                = var.function_name
  function_app_id     = azurerm_linux_function_app.test.id
   language        = var.language
  test_data = var.test_data
  config_json = var.config_json
}


