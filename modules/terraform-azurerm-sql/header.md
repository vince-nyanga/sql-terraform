# sql_server

This module provisions a SQL Server in Azure.

## Usage

---

```hcl
module "sql" {

source = "./modules/terraform-azurerm-sql"

server_name                    = var.sql_server_name
resource_group_name            = var.resource_group_name
location                       = var.location
administrator_username         = var.azurerm_key_vault_secret.sql_admin_username
administrator_password         = var.azurerm_key_vault_secret.sql_admin_password
allow_access_to_azure_services = var.allow_access_to_azure_services
ip_range_filter                = var.ip_range_filter
subnets                        = var.subnets
tags                           = var.tags
}
```

> **Warning**
>
> Do not store the admin credentials in clear text inside your script. Rather use a service like Azure Key Vault to safely store them.
