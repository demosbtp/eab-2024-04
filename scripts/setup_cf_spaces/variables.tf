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
  default = [ "eu10", "us10", "jp10" ]

}

variable "admins" {
  type        = list(string)
  description = "Defines the colleagues who are added to each subaccount as emergency administrators."
}


variable "cf_details" {
  type        = map(object({
    cf_api_endpoint    = string
    cf_env_instance_id = string
    cf_org_id          = string
  }))
  description = "The Cloud Foundry details for each region."
}

# cf_details = {
#   "eu10" = {
#     "cf_api_endpoint" = "https://api.cf.eu10.hana.ondemand.com"
#     "cf_env_instance_id" = "E2144074-994A-473E-B075-23B4A15815B7"
#     "cf_org_id" = "2f67cfef-b979-494c-b90a-15ab7edeb3ad"
#   }
#   "us10" = {
#     "cf_api_endpoint" = "https://api.cf.us10.hana.ondemand.com"
#     "cf_env_instance_id" = "D8666BCA-8389-4237-9193-49CDED4BEB91"
#     "cf_org_id" = "a8442a0e-efb2-446c-8b1d-2300f1ab0ac1"
#   }
# }