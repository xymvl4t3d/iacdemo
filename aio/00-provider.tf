terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "6.7.0"
    }
  }
}

provider "oci" {
  region = var.region
  #   compartment_id = var.compartment_ocid
}