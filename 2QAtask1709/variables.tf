
variable "plan_name" {
  default = "reactAppServicePlan"
}

variable "image_name" {
  default = "my-react-app"
}

variable "image_tag" {
  default = "latest"
}

variable "location" {}
variable "app_service_fqdn" {}

variable "subnet_id" {
  type = string
  description = "Subnet ID for the Application Gateway"
}


variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
}

variable "resource_group" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "app_name" {
  description = "Name of the App Service"
  type        = string
}

