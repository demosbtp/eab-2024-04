variable "globalaccount" {
  type        = string
  description = "The globalaccount subdomain where the sub account shall be created."
}

variable "region" {
  type        = string
  description = "The region where the subaccount shall be created."
}

variable "subaccount_name" {
  type        = string
  description = "The subaccount name."
}

variable "admins" {
  type        = list(string)
  description = "Defines the colleagues who are added to each subaccount as emergency administrators."
  default     = ["christian.lechner@sap.com", "rui.nogueira@sap.com"]
}

variable "entitlements" {
  type = list(object({
    name   = string
    plan   = string
    amount = number
  }))
  description = "Map of entitlements to be created in the subaccount"
}
