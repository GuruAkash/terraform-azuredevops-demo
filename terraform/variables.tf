variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}
variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "subnet_name" {
  type = string
}

variable "subnet_prefixes" {
  type = list(string)
}

variable "nsg_name" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "environment" {
  type = string
}