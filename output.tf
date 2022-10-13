output "sql_server_id" {
  description = "sql server id."
  value       = module.sql.id
}

output "sql_server_domain_name" {
  description = "sql server domain name."
  value       = module.sql.domain_name
}
