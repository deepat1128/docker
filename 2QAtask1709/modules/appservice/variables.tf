variable "app_name" {}
variable "plan_name" {}
variable "resource_group_name" {}
variable "location" {}
variable "acr_login_server" {}
variable "acr_username" {}
variable "acr_password" {}
variable "image_name" {}
variable "image_tag" {}
variable "gateway_subnet_id" {
  description = "The subnet ID of the Application Gateway to allow access from"
  type        = string
}

