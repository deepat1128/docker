variable "resource_group_name" {
  description = "Resource group for monitoring resources"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "app_service_id" {
  description = "The resource ID of the App Service to monitor"
  type        = string
}

