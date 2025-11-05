variable "location" {}
variable "resource_group_name" {}
variable "subnet_id" {
  type        = string
  description = "The subnet ID for the Application Gateway IP configuration"
}

variable "app_service_fqdn" {}        # e.g. react-nginx-app.azurewebsites.net

