<!-- BEGIN_TF_DOCS -->

# sql\_server

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

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

#### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_password"></a> [administrator\_password](#input\_administrator\_password) | administrator password. | `string` | n/a | yes |
| <a name="input_administrator_username"></a> [administrator\_username](#input\_administrator\_username) | administrator user name | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | location. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | resource group name. | `string` | n/a | yes |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | server nam. | `string` | n/a | yes |
| <a name="input_allow_access_to_azure_services"></a> [allow\_access\_to\_azure\_services](#input\_allow\_access\_to\_azure\_services) | whether or not to allow azure services to access the sql server. | `bool` | `false` | no |
| <a name="input_ip_range_filter"></a> [ip\_range\_filter](#input\_ip\_range\_filter) | this value specifies the comma-separated set of IP address ranges in CIDR Format. | `string` | `""` | no |
| <a name="input_server_version"></a> [server\_version](#input\_server\_version) | server version. Valid values are 2.0 and 12.0 | `string` | `"12.0"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | list of v-net subnets that are allowed to access the server. | <pre>list(object({<br>    name      = string<br>    subnet_id = string<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | tags. | `map(any)` | `{}` | no |

You can also show something after it!
<!-- END_TF_DOCS -->
