resource "oci_core_vcn" "vcn01" {
  cidr_block     = var.vcn_cidr_block
  display_name   = var.vcn_display_name
  compartment_id = var.compartment_ocid
}

resource "oci_core_subnet" "subnet01" {
  cidr_block                 = var.subnet_cidr_block
  vcn_id                     = oci_core_vcn.vcn01.id
  display_name               = var.subnet_display_name
  compartment_id             = var.compartment_ocid
  prohibit_public_ip_on_vnic = var.prohibit_state
}

resource "oci_core_instance" "instance01" {
  availability_domain = var.avail_domain
  compartment_id      = var.compartment_ocid
  shape               = var.shape

  create_vnic_details {
    subnet_id        = oci_core_subnet.subnet01.id
    assign_public_ip = var.assign_public_ip
  }

  display_name = var.instance_display_name

  source_details {
    source_type = var.instance_source_type
    source_id   = var.instance_image_ocid
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh)
  }
}