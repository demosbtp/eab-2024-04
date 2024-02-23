
# ------------------------------------------------------------------------------------------------------
# Create Cloud Foundry space and assign users
# ------------------------------------------------------------------------------------------------------
module "cloudfoundry_space" {
  source              = "../modules/environment/cloudfoundry/space_cf"
  cf_org_id           = var.cf_org_id
  name                = "dev"
  cf_space_managers   = var.admins
  cf_space_developers = var.admins
  cf_space_auditors   = var.admins
}
