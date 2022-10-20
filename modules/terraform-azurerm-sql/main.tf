locals {
  ip_rules = [for index, ip_range in compact(split(",", var.ip_range_filter)) : { name = "Rule-${index}", ip_range = ip_range }]
  subnets  = [for index, subnet_id in var.subnet_ids : { name = "Subnet-${index}", subnet_id = subnet_id }]
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
  count = length(local.ip_rules)

  server_id        = azurerm_mssql_server.this.id
  name             = local.ip_rules[count.index].name
  start_ip_address = cidrhost(local.ip_rules[count.index].ip_range, 0)
  end_ip_address   = cidrhost(local.ip_rules[count.index].ip_range, -1)
}

resource "azurerm_mssql_virtual_network_rule" "this" {
  count = length(local.subnets)

  server_id = azurerm_mssql_server.this.id
  name      = local.subnets[count.index].name
  subnet_id = local.subnets[count.index].subnet_id
}
