
terraform {
  required_providers {
    btp = {
      source  = "SAP/btp"
      version = "~>1.0.0"
    }
    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = "~>0.53.0"
    }
  }
}

provider "btp" {
  globalaccount  = var.globalaccount
}

// Configuration is described in https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs
provider "cloudfoundry" {
  api_url = "https://api.cf.${var.region}.hana.ondemand.com"
}
