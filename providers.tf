terraform {
  required_providers {
    outscale = {
      source  = "outscale-dev/outscale"
      version = "0.5.4"
    }
  }
}

provider "outscale" {
  region        = var.region
  access_key_id = var.outscale_access_key
  secret_key_id = var.outscale_secret_key
}
