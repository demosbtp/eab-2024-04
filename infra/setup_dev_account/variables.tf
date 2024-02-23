variable "globalaccount" {
  type        = string
  description = "The globalaccount subdomain where the sub account shall be created."
}

variable "subaccount_name" {
  type        = string
  description = "The subaccount name."
}

variable "regions" {
  type        = list(string)
  description = "The regions where the subaccount shall be created."
  default     = ["eu10", "us10"]

}

variable "admins" {
  type        = list(string)
  description = "Defines the colleagues who are added to each subaccount as emergency administrators."
}


variable "tfvarsEntitlements" {
  type = list(object({
    name   = string
    plan   = string
    amount = number
  }))
  description = "Map of entitlements to be created in the subaccount"
  default = [
    {
      name   = "auditlog-viewer"
      plan   = "free"
      amount = null
    }
  ]
}
