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

variable "subnet_cidr_block" {
  type = string
}

variable "subnet_display_name" {
  type = string
}

variable "prohibit_state" {
  type = bool
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