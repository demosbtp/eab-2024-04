# ------------------------------------------------------------------------------------------------------
# Create Cloud Foundry space and assign users
# ------------------------------------------------------------------------------------------------------
module "cloudfoundry_space" {
  source              = "../modules/environment/cloudfoundry/space_cf"
  cf_org_id           = var.cf_org_id
  name                = var.cf_space_name
  cf_space_managers   = []
  cf_space_developers = []
  cf_space_auditors   = []
}
