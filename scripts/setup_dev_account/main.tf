# ------------------------------------------------------------------------------------------------------
# Setup subaccount domain (to ensure uniqueness in BTP global account)
# ------------------------------------------------------------------------------------------------------
locals {
  project_subaccount_domain = "btpeab24"

  role_mapping_admins = distinct(flatten([
    for admin in var.admins : [
      for role in var.role_collections_for_use_case : {
        user_name = admin
        role_name = role
      }
    ]
  ]))
}

# ------------------------------------------------------------------------------------------------------
# Creation of subaccount
# ------------------------------------------------------------------------------------------------------
resource "btp_subaccount" "eab" {
  name      = var.subaccount_name
  subdomain = local.project_subaccount_domain
  region    = lower(var.region)
}

# ------------------------------------------------------------------------------------------------------
# Entitle subaccount for usage of SAP Business Application Studio
# ------------------------------------------------------------------------------------------------------
resource "btp_subaccount_entitlement" "bas" {
  subaccount_id = btp_subaccount.eab.id
  service_name  = "sapappstudio"
  plan_name     = "standard-edition"
}

# ------------------------------------------------------------------------------------------------------
# Create app subscription to SAP Business Application Studio
# ------------------------------------------------------------------------------------------------------
resource "btp_subaccount_subscription" "bas" {
  subaccount_id = btp_subaccount.eab.id
  app_name      =  "sapappstudio"
  plan_name     = "standard-edition"
  depends_on = [ btp_subaccount_entitlement.bas ]
}

# ------------------------------------------------------------------------------------------------------
# Assign role collections to admins
# ------------------------------------------------------------------------------------------------------
# Assign users to Role Collection of SAP AI Launchpad
resource "btp_subaccount_role_collection_assignment" "ai_launchpad_role_mapping" {
  for_each             = { for entry in local.role_mapping_admins : "${entry.user_name}.${entry.role_name}" => entry }
  subaccount_id        = btp_subaccount.eab.id
  role_collection_name = each.value.role_name
  user_name            = each.value.user_name
  depends_on           = [btp_subaccount_subscription.bas]
}

###
# Create Cloud Foundry environment
###
module "cloudfoundry_environment" {
  source = "../modules/environment/cloudfoundry/envinstance_cf"

  subaccount_id           = btp_subaccount.eab.id
  instance_name           = "cf-instance"
  cf_org_name             = "eab-2024-04"
  cf_org_managers         = []
  cf_org_billing_managers = []
  cf_org_auditors         = []
}
