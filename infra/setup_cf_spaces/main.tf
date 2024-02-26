# ------------------------------------------------------------------------------------------------------
# Create Cloud Foundry space and assign users
# ------------------------------------------------------------------------------------------------------
module "cloudfoundry_space" {
  source              = "../modules/environment/cloudfoundry/space_cf"
  cf_org_id           = var.cf_org_id
  name                = var.cf_space_name
  cf_space_managers   = ["rui.nogueira@sap.com", "christian.lechner@sap.com"]
  cf_space_developers = ["rui.nogueira@sap.com", "christian.lechner@sap.com"]
  cf_space_auditors   = ["rui.nogueira@sap.com", "christian.lechner@sap.com"]
}


data "cloudfoundry_service" "hana_cloud" {
  name = "hana-cloud"
}

resource "cloudfoundry_service_instance" "hana_cloud_hana" {
  name         = "hana-cloud"
  space        = module.cloudfoundry_space.space_id
  service_plan = data.cloudfoundry_service.hana_cloud.service_plans["hana"]
  json_params  = jsonencode({"data": {"memory": 30,"edition": "cloud","systempassword": "Abcd1234", "whitelistIPs": ["0.0.0.0/0"]}})
}