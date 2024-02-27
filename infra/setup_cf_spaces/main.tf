# ------------------------------------------------------------------------------------------------------
# Create Cloud Foundry space and assign users
# ------------------------------------------------------------------------------------------------------
module "cloudfoundry_space" {
  source              = "../modules/environment/cloudfoundry/space_cf"
  cf_org_id           = var.cf_org_id
  name                = var.cf_space_name
  cf_space_managers   = ["rui.nogueira@sap.com"]
  cf_space_developers = ["rui.nogueira@sap.com"]
  cf_space_auditors   = ["rui.nogueira@sap.com"]
}


# ------------------------------------------------------------------------------------------------------
# Timeout - Ensure that the service entitlement is propagated to CF Marketplace
# ------------------------------------------------------------------------------------------------------
resource "time_sleep" "wait_for_cfmarketplace" {
  create_duration = "30s"
}

# ------------------------------------------------------------------------------------------------------
# Create Service Instance for HANA Cloud
# ------------------------------------------------------------------------------------------------------
module "cloudfoundry_hana_cloud" {
  source      = "../modules/services/hanacloud_cf"
  cf_space_id = module.cloudfoundry_space.cf_space_id
  depends_on  = [time_sleep.wait_for_cfmarketplace]
}
