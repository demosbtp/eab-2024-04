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

# module "cloudfoundry_deploy_app" {
#   source            = "../modules/environment/cloudfoundry/deploy_app"
#   folder_cap_mtar   = var.folder_cap_mtar
#   cf_api_endpoint   = var.cf_api_endpoint
#   cf_space_name     = module.cloudfoundry_space.name
#   cf_org_id         = var.cf_org_id
#   cf_org_name       = var.cf_org_name
#   name              = module.cloudfoundry_space.name
# }
