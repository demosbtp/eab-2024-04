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
  default     = "us10"
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
    "Business_Application_Studio_Administrator",
    "Business_Application_Studio_Developer",
    "Business_Application_Studio_Extension_Deployer",
    "Subaccount Administrator",
    "Subaccount Service Administrator"
  ]

}

variable "tfvarsEntitlements" {
  type        = map(string)
  description = "Map of entitlements to be created in the subaccount"
  default = [
    {
      name = "cloud-logging"
      plan = "standard"
      amount = null
    }
  ]
  
}