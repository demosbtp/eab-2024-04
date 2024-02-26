terraform {
  required_providers {
    btp = {
      source  = "SAP/btp"
      version = "~>1.0.0"
    }
  }
}

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
# Add admin users
# ------------------------------------------------------------------------------------------------------
resource "btp_subaccount_role_collection_assignment" "admin_assigmment" {
  for_each             = { for entry in local.role_mapping_admins : "${entry.user_name}.${entry.role_name}" => entry }
  subaccount_id        = btp_subaccount.eab.id
  role_collection_name = each.value.role_name
  user_name            = each.value.user_name
}

# ------------------------------------------------------------------------------------------------------
# Create entitlements in the subaccount for additional services
# ------------------------------------------------------------------------------------------------------
resource "btp_subaccount_entitlement" "additional_entitlements" {
  for_each      = { for entry in var.entitlements : "${entry.name}.${entry.plan}" => entry }
  subaccount_id = btp_subaccount.eab.id
  service_name  = each.value.name
  plan_name     = each.value.plan
}

# ------------------------------------------------------------------------------------------------------
# Create Cloud Foundry environment
# ------------------------------------------------------------------------------------------------------
module "cloudfoundry_environment" {
  source = "../environment/cloudfoundry/envinstance_cf"

  subaccount_id = btp_subaccount.eab.id
  instance_name = "cf-instance"
  cf_org_name   = var.cf_org_name
}


# Assign users to Role Collection of SAP AI Launchpad
resource "btp_subaccount_role_collection_assignment" "role_mapping" {
  for_each             = { for entry in local.role_mapping_admins : "${entry.user_name}.${entry.role_name}" => entry }
  subaccount_id        = btp_subaccount.eab.id
  role_collection_name = each.value.role_name
  user_name            = each.value.user_name
  depends_on           = [btp_subaccount_entitlement.additional_entitlements]
}
