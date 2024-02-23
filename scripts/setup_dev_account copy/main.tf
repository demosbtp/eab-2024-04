module "subaccount_setup" {
  for_each = var.regions

  source = "../modules/subaccount_setup"
  globalaccount = var.globalaccount
  subaccount_name = var.subaccount_name
  region = each.value
  admins = var.admins

}