variable "sql_server_name" {
  description = "sql server name"
  type        = string
  default     = "terrorsql"
}

variable "key_vault_name" {
  description = "key vault name"
  type        = string
  default     = "vhonesvault"
}

variable "administrator_login_name" {
  description = "sql admnistrator user name"
  type        = string
  default     = "sql-admin-username"
}

variable "administrator_login_password_name" {
  description = "sql administrator passwor name"
  type        = string
  default     = "sql-admin-password"
}
