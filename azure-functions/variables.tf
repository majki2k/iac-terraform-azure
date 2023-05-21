variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default      = "test-resource-group"
}

variable "location" {
  description = "Location of the resources"
  type        = string
  default     = "West Europe"
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
  default     = "test_storage_account"
}


variable "account_tier" {
  description = "Type of the account tier"
  type        = string
  default     = "Standard"
}


variable "account_replication_type" {
  description = "Type of the replication type"
  type        = string
  default     = "LRS"
}

variable "app_service_plan_name" {
  description = "Name of the app service plan"
  type        = string
  default     = "test-app-service-plan"
}

  
variable "kind" {
  description = "Kind type"
  type        = string
  default     = "Linux"
}

variable "reserved" {
  description = "IS the plan reserved"
  type        = bool
  default     = "true"
}
  
variable "sku_tier" {
  type        = string
  default     = "Standard"
}
  
variable "sku_size" {
  type        = string
  default     = "S1"
}
  
  
variable "function_app_name" {
  description = "Name of the function app"
  type        = string
  default     = "test-linux-function-app"
}

variable "function_name" {
  description = "Name of the function"
  type        = string
  default     = "test-function"
}

variable "function_schedule" {
  description = "Schedule for the function trigger"
  type        = string
  default     = "0 */5 * * * *"
}

variable "function_app_settings1" {
  description = "Additional settings for the function app"
  type        = string
  default     = "value1"
}

variable "function_app_settings2" {
  description = "Additional settings for the function app"
  type        = string
  default     = "value2"
}

