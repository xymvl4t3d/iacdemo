terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "6.7.0"
    }
  }
}

provider "oci" {
  # tenancy_ocid = "<tenancy OCID>"
  # user_ocid = "<user OCID>"
  # private_key_path = "<key path>"
  # fingerprint = "<fingerprint>"
  region = var.region
}