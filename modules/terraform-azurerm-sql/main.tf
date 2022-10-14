locals {
  ip_rules = compact(split(",", var.ip_range_filter))
}

resource "azurerm_mssql_server" "this" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.server_version
  administrator_login          = var.administrator_username
  administrator_login_password = var.administrator_password
  minimum_tls_version          = "1.2" # make this a variable too with 1.2 as the default
  tags                         = var.tags
}

resource "azurerm_mssql_firewall_rule" "azure" {
  count = var.allow_access_to_azure_services ? 1 : 0

  server_id        = azurerm_mssql_server.this.id
  name             = "Azure services"
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

resource "azurerm_mssql_firewall_rule" "this" {
  for_each = toset(local.ip_rules)

  server_id        = azurerm_mssql_server.this.id
  name             = trimsuffix(base64encode(each.key), "=")
  start_ip_address = cidrhost(each.value, 0)
  end_ip_address   = cidrhost(each.value, -1)
}

resource "azurerm_mssql_virtual_network_rule" "this" {
  count = length(var.subnets)

  server_id = azurerm_mssql_server.this.id
  name      = var.subnets[count.index].name
  subnet_id = var.subnets[count.index].subnet_id
}
