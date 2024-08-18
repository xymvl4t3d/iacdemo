variable "region" {
  type = string
}

variable "compartment_ocid" {
  type = string
}

variable "vcn_cidr_block" {
  type = string
}

variable "vcn_display_name" {
  type = string
}

variable "igw_display_name" {
  type = string
}

variable "igw_enabled" {
  type = bool
}

variable "rt01_display_name" {
  type = string
}

variable "rr_dest" {
  type = string
}

variable "rr_dest_type" {
  type = string
}

variable "subnet_cidr_block" {
  type = string
}

variable "subnet_display_name" {
  type = string
}

variable "prohibit_state" {
  type = bool
}

variable "nsg01_display_name" {
  type = string
}

variable "sr_dir" {
  type = string
}

variable "sr_prot" {
  type = string
}

variable "sr_ip" {
  type = string
  sensitive = true
}

variable "sr_st" {
  type = string
}

variable "sr_isl" {
  type = bool
}

variable "sr_desc" {
  type = string
}

variable "avail_domain" {
  type = string
}

variable "shape" {
  type = string
}

variable "assign_public_ip" {
  type = bool
}

variable "instance_display_name" {
  type = string
}

variable "instance_source_type" {
  type = string
}

variable "instance_image_ocid" {
  type = string
}

variable "ssh" {
  type = string
}