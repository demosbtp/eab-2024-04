
# ------------------------------------------------------------------------------------------------------
# Create Cloud Foundry space and assign users
# ------------------------------------------------------------------------------------------------------
module "cloudfoundry_space" {
  for_each        = { for entry in var.cf_details : "${entry}.${entry.name}.${entry.plan}" => entry }


  source              = "../modules/environment/cloudfoundry/space_cf"
  cf_org_id           = each.value.cf_org_id
  name                = "dev"
  cf_space_managers   = var.admins
  cf_space_developers = var.admins
  cf_space_auditors   = var.admins
}