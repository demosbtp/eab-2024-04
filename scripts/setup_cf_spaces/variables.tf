variable "admins" {
  type        = list(string)
  description = "Defines the colleagues who are added to each subaccount as emergency administrators."
}

variable "cf_org_id" {
  type        = string
  description = "ID of the Cloud Foundry org."
}
