resource "azurerm_service_plan" "plan" {
  name                = var.plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = "S1"
}

resource "azurerm_linux_web_app" "app" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.plan.id

site_config {
  linux_fx_version = "DOCKER|${var.acr_login_server}/${var.image_name}:${var.image_tag}"

}

  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL"      = "https://${var.acr_login_server}"
    "DOCKER_REGISTRY_SERVER_USERNAME" = var.acr_username
    "DOCKER_REGISTRY_SERVER_PASSWORD" = var.acr_password
  }

  tags = {
    restart_trigger = timestamp()
  }

  identity {
    type = "SystemAssigned"
  }
}

