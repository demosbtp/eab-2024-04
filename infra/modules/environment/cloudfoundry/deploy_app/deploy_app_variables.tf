variable "folder_cap_mtar" {
  type        = string
  description = "The path to the mta archive file."
}

variable "cf_api_endpoint" {
  type        = string
  description = "The API endpoint of the Cloud Foundry environment."
}

variable "cf_space_name" {
  type        = string
  description = "The name of the Cloud Foundry space."
  default     = "dev"
}

variable "cf_org_id" {
  type        = string
  description = "The ID of the Cloud Foundry org."
}

variable "cf_org_name" {
  type        = string
  description = "The name of the Cloud Foundry org."
}
