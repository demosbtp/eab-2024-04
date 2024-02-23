variable "admins" {
  type        = list(string)
  description = "Defines the colleagues who are added to each subaccount as emergency administrators."
}

variable "cf_org_id" {
  type        = string
  description = "ID of the Cloud Foundry org."
}

variable "cf_api_endpoint" {
  type        = string
  description = "API endpoint of the Cloud Foundry environment."
}

variable "cf_org_name" {
  type        = string
  description = "Name of the Cloud Foundry org."
}

variable "folder_cap_mtar" {
  type        = string
  description = "Path to the mta archive file."
}
