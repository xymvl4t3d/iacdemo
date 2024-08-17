resource "oci_core_virtual_network" "vcn" {
  cidr_block     = var.cidr_block
  dns_label      = var.display_name
  compartment_id = var.compartment_id  
  display_name   = var.display_name
}