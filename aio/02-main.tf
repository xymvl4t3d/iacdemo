resource "oci_core_vcn" "vcn01" {
  compartment_id = var.compartment_ocid
  cidr_block     = var.vcn_cidr_block
  display_name   = var.vcn_display_name
}

resource "oci_core_internet_gateway" "igw01" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn01.id
  display_name   = var.igw_display_name
  enabled        = var.igw_enabled
}

resource "oci_core_route_table" "rt01" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn01.id
  display_name   = var.rt01_display_name

  route_rules {
    destination       = var.rr_dest
    destination_type  = var.rr_dest_type
    network_entity_id = oci_core_internet_gateway.igw01.id
  }
}

resource "oci_core_subnet" "subnet01" {
  compartment_id             = var.compartment_ocid
  cidr_block                 = var.subnet_cidr_block
  vcn_id                     = oci_core_vcn.vcn01.id
  display_name               = var.subnet_display_name
  prohibit_public_ip_on_vnic = var.prohibit_state
  route_table_id             = oci_core_route_table.rt01.id
}

resource "oci_core_network_security_group" "nsg01" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn01.id
  display_name   = var.nsg01_display_name
}

resource "oci_core_network_security_group_security_rule" "ir01" {
  compartment_id            = var.compartment_ocid
  network_security_group_id = oci_core_network_security_group.nsg01.id

  security_rule {
    direction    = var.sr_dir
    protocol     = var.sr_prot
    source       = var.sr_ip
    source_type  = var.sr_st
    is_stateless = var.sr_isl
    desc         = var.sr_desc
  }
}

resource "oci_core_instance" "instance01" {
  availability_domain = var.avail_domain
  compartment_id      = var.compartment_ocid
  shape               = var.shape

  create_vnic_details {
    subnet_id        = oci_core_subnet.subnet01.id
    assign_public_ip = var.assign_public_ip
    nsg_ids          = [oci_core_network_security_group.nsg01.id]
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