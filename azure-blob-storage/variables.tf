variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "test-resource-group"
}

variable "location" {
  type        = string
  default     = "West Europe"
}


variable "account_tier" {
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  default     = "LRS"
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
  default     = "teststorageaccount"
}

variable "storage_container_name" {
  description = "Name of the storage container"
  type        = string
  default     = "testcontainer"
}


variable "container_access_type" {
  type        = string
  default     = "private"
}


variable "storage_blob_name" {
  description = "Name of the storage blob"
  type        = string
  default     = "testblob.zip"
}


variable "type" {
  type        = string
  default     = "Block"
}

variable "storage_blob_source" {
  description = "Local path of the file to upload to the storage blob"
  type        = string
  default     = "some_local_file.zip"
}

