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

resource "azurerm_storage_container" "test_storage_container" {
  name                  = "testcontainer"
  storage_account_name  = azurerm_storage_account.test_storage_account.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "test_storage_blob" {
  name                   = "testblob.zip"
  storage_account_name   = azurerm_storage_account.test_storage_account.name
  storage_container_name = azurerm_storage_container.test_storage_container.name
  type                   = "Block"
  source                 = "some_local_file.zip"
}

