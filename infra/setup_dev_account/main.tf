module "subaccount_setup" {
  source          = "../modules/subaccount_setup"
  globalaccount   = var.globalaccount
  subaccount_name = "${var.subaccount_name}-${var.region}"
  region          = var.region
  admins          = var.admins
  entitlements    = var.entitlements
}
