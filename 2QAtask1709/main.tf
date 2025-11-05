module "acr" {
  source              = "./modules/acr"
  acr_name            = var.acr_name
  resource_group_name = var.resource_group
  location            = var.location
}


module "app_gateway" {
  source              = "./modules/agw"
  resource_group_name = var.resource_group
  location            = var.location
  app_service_fqdn    = module.app_service.default_hostname
 subnet_id           = var.subnet_id
}

module "monitoring" {
  source              = "./modules/monitoring"
  resource_group_name = var.resource_group
 location            = var.location
  app_service_id      = module.app_service.app_service_id
}

module "app_service" {
  source              = "./modules/appservice"
  app_name            = var.app_name
  plan_name           = var.plan_name
  resource_group_name = var.resource_group
  location            = var.location
  acr_login_server    = module.acr.login_server
  acr_username        = module.acr.username
  acr_password        = module.acr.password
  image_name          = var.image_name
  image_tag           = var.image_tag
  gateway_subnet_id   = module.app_gateway.gateway_subnet_id
}

