variable "globalaccount" {
  type        = string
  description = "The globalaccount subdomain where the sub account shall be created."
}

variable "subaccount_name" {
  type        = string
  description = "The subaccount name."
  default     = "My SAP Build Apps subaccount."
}

variable "region" {
  type        = string
  description = "The region where the sub account shall be created in."
}

variable "admins" {
  type        = list(string)
  description = "Defines the colleagues who are added to each subaccount as emergency administrators."
}

# Define roles for a user of the SAP AI Launchpad
variable "role_collections_for_use_case" {
  type        = list(string)
  description = "Defines the list of roles to be assigned to the users for this use case"
  default = [
    "Subaccount Administrator",
    "Subaccount Service Administrator"
  ]
}

variable "entitlements" {
  type = list(object({
    name   = string
    plan   = string
    amount = number
  }))
  description = "Map of entitlements to be created in the subaccount"
}

variable "cf_org_name" {
  type        = string
  description = "Name of the Cloud Foundry org."
  default     = "eab-2024-04"
}
