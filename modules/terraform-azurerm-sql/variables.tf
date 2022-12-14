variable "administrator_username" {
  description = "administrator user name"
  type        = string
}

variable "administrator_password" {
  description = "administrator password."
  type        = string
}

variable "server_name" {
  description = "server nam."
  type        = string
}

variable "server_version" {
  description = "server version. Valid values are 2.0 and 12.0"
  type        = string
  default     = "12.0"
}

variable "resource_group_name" {
  description = "resource group name."
  type        = string
}

variable "location" {
  description = "location."
  type        = string
}

variable "tags" {
  description = "tags."
  type        = map(any)
  default     = {}
}

variable "ip_range_filter" {
  default     = ""
  description = "this value specifies the comma-separated set of IP address ranges in CIDR Format."
  type        = string
}

variable "allow_access_to_azure_services" {
  description = "whether or not to allow azure services to access the sql server."
  type        = bool
  default     = false
}

variable "subnet_ids" {
  description = "list of v-net subnets that are allowed to access the server."
  type        = list(string)
  default     = []
}
