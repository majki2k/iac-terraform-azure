variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "storage_container_name" {
  description = "Name of the storage container"
  type        = string
}

variable "storage_blob_name" {
  description = "Name of the storage blob"
  type        = string
}

variable "storage_blob_source" {
  description = "Local path of the file to upload to the storage blob"
  type        = string
}

