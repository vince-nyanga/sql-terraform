<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_firewall_rule.azure](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_firewall_rule) | resource |
| [azurerm_mssql_firewall_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_firewall_rule) | resource |
| [azurerm_mssql_server.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server) | resource |
| [azurerm_mssql_virtual_network_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_virtual_network_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_password"></a> [administrator\_password](#input\_administrator\_password) | administrator password. | `string` | n/a | yes |
| <a name="input_administrator_username"></a> [administrator\_username](#input\_administrator\_username) | administrator user name | `string` | n/a | yes |
| <a name="input_allow_access_to_azure_services"></a> [allow\_access\_to\_azure\_services](#input\_allow\_access\_to\_azure\_services) | whether or not to allow azure services to access the sql server. | `bool` | `false` | no |
| <a name="input_ip_range_filter"></a> [ip\_range\_filter](#input\_ip\_range\_filter) | this value specifies the comma-separated set of IP address ranges in CIDR Format. | `string` | `""` | no |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | id of the key vault storing administrator login secrets. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | location. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | resource group name. | `string` | n/a | yes |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | server nam. | `string` | n/a | yes |
| <a name="input_server_version"></a> [server\_version](#input\_server\_version) | server version. Valid values are 2.0 and 12.0 | `string` | `"12.0"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | list of v-net subnets that are allowed to access the server. | <pre>list(object({<br>    name      = string<br>    subnet_id = string<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | tags. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domain_name"></a> [domain\_name](#output\_domain\_name) | Sql server fully qualified domain name. |
| <a name="output_id"></a> [id](#output\_id) | Sql server id |
<!-- END_TF_DOCS -->