variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the resources"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the app service plan"
  type        = string
}

variable "function_app_name" {
  description = "Name of the function app"
  type        = string
}

variable "function_name" {
  description = "Name of the function"
  type        = string
}

variable "function_schedule" {
  description = "Schedule for the function trigger"
  type        = string
}

variable "function_app_settings" {
  description = "Additional settings for the function app"
  type        = map(string)
}

