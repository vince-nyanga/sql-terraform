terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.99.0" # Need to use this version because all versions >= 3.0.0 have an issue when trying to read key vault secrets (https://github.com/hashicorp/terraform-provider-azurerm/issues/16052)
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "rg" {
  name = "rg-sql-terror"
}

data "azurerm_key_vault" "vault" {
  name                = var.key_vault_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_key_vault_secret" "sql_admin_username" {
  name         = var.administrator_login_name
  key_vault_id = data.azurerm_key_vault.vault.id
}

data "azurerm_key_vault_secret" "sql_admin_password" {
  name         = var.administrator_login_password_name
  key_vault_id = data.azurerm_key_vault.vault.id
}


resource "azurerm_virtual_network" "vnet" {
  name                = "honesdev-vnet"
  address_space       = ["10.7.29.0/29"]
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "honesdev-subnet"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = resource.azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.7.29.0/29"]
  service_endpoints    = ["Microsoft.Sql"]
}

module "sql" {

  source = "./modules/terraform-azurerm-sql"

  server_name                    = var.sql_server_name
  resource_group_name            = data.azurerm_resource_group.rg.name
  location                       = data.azurerm_resource_group.rg.location
  key_vault_id                   = data.azurerm_key_vault.vault.id
  administrator_username         = data.azurerm_key_vault_secret.sql_admin_username.value
  administrator_password         = data.azurerm_key_vault_secret.sql_admin_password.value
  allow_access_to_azure_services = true
  ip_range_filter                = "192.168.0.0/24,10.10.0.0/16"
  subnets = [{
    name      = "vhones-subnet-rule"
    subnet_id = resource.azurerm_subnet.subnet.id
  }]

  tags = {
    env       = "dev"
    createdBy = "Terraform"
  }
}
