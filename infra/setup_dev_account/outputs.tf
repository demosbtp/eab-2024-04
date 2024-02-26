output "cf_env_instance_id" {
  value       = module.subaccount_setup.cf_env_instance_id
  description = "ID of the Cloud Foundry environment instance."
}

output "cf_org_id" {
  value       = module.subaccount_setup.cf_org_id
  description = "ID of the Cloud Foundry org."
}

output "cf_org_name" {
  value       = module.subaccount_setup.cf_org_name
  description = "Name of the Cloud Foundry org."
}

output "cf_api_endpoint" {
  value       = module.subaccount_setup.cf_api_endpoint
  description = "API endpoint of the Cloud Foundry environment."
}

output "cf_instance_id" {
  value       = module.subaccount_setup.cf_env_instance_id
  description = "ID of the Cloud Foundry environment instance."
}
