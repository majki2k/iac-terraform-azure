output "storage_blob_url" {
  value = azurerm_storage_blob.test_storage_blob.url
  description = "URL of the storage blob"
}

