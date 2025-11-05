resource "azurerm_public_ip" "gateway_ip" {
  name                = "appGatewayPublicIP"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_application_gateway" "gateway" {
  name                = "reactAppGateway"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    name     = "WAF_v2"
    tier     = "WAF_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "appGatewayIPConfig"
    subnet_id = var.subnet_id
  }

  frontend_port {
    name = "frontendPort"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "frontendIP"
    public_ip_address_id = azurerm_public_ip.gateway_ip.id
  }

  backend_address_pool {
    name = "appServicePool"
    fqdns = [var.app_service_fqdn]
  }

backend_http_settings {
  name                                = "httpSettings"
  port                                = 80
  protocol                            = "Http"
  request_timeout                     = 30
  cookie_based_affinity               = "Disabled"
  pick_host_name_from_backend_address = true
  probe_name                          = "healthProbe"  # Reference to your probe block
}


  http_listener {
    name                           = "httpListener"
    frontend_ip_configuration_name = "frontendIP"
    frontend_port_name             = "frontendPort"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "routingRule"
    rule_type                  = "Basic"
    http_listener_name         = "httpListener"
    backend_address_pool_name  = "appServicePool"
    backend_http_settings_name = "httpSettings"
  }

  waf_configuration {
    enabled            = true
    firewall_mode      = "Prevention"
    rule_set_type      = "OWASP"
    rule_set_version   = "3.2"
  }

probe {
  name                                      = "healthProbe"
  protocol                                  = "Http"
  host                                      = var.app_service_fqdn
  path                                      = "/health"
  interval                                  = 30
  timeout                                   = 30
  unhealthy_threshold                       = 3
  pick_host_name_from_backend_http_settings = true
}


}

