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

resource "azurerm_storage_container" "test" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.test.name
  container_access_type = var.container_access_type
}

resource "azurerm_storage_blob" "test" {
  name                   = var.storage_blob_name
  storage_account_name   = azurerm_storage_account.test.name
  storage_container_name = azurerm_storage_container.test.name
  type                   = var.type
  source                 = var.storage_blob_source
}

