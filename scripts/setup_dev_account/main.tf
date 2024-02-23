module "subaccount_setup" {
  for_each = toset(var.regions)

  source             = "../modules/subaccount_setup"
  globalaccount      = var.globalaccount
  subaccount_name    = "${var.subaccount_name}-${each.value}"
  region             = each.value
  admins             = var.admins
  tfvarsEntitlements = var.tfvarsEntitlements
}
