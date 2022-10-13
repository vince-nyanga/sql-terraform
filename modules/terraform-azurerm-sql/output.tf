output "id" {
  description = "Sql server id"
  value       = azurerm_mssql_server.this.id
}

output "domain_name" {
  description = "Sql server fully qualified domain name."
  value       = azurerm_mssql_server.this.fully_qualified_domain_name
}
