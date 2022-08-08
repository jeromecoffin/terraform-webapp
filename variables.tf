variable "region" {
  type    = string
  default = "cloudgouv-eu-west-1"
}

variable "outscale_access_key" {
  default = "EGMZ6XJACV1ASVP5Q7A4"
}

variable "outscale_secret_key" {
  default = "Q2O7Z1PF6YJ0POQQJ3NH5LXDPDMZCMDEMEX4I0QW"
}

variable "vpc_ip_range" {
  type    = string
  default = "10.1.0.0/16"
}

variable "subnet_ip_range" {
  type    = string
  default = "10.1.0.0/24"
}

variable "bastion_image_id" {
  default = "ami-c4255476"
}

variable "bastion_vm_type" {
  default = "tinav3.c1r2p3"
}

variable "storage_image_id" {
  default = "ami-c4255476"
}

variable "storage_vm_type" {
  default = "tinav3.c4r12p2"
}

variable "db_image_id" {
  default = "ami-c4255476"
}

variable "db_vm_type" {
  default = "tinav3.c8r20p3	"
}

variable "ws_image_id" {
  default = "ami-c4255476"
}

variable "ws_vm_type" {
  default = "tinav3.c12r62p3"
}

variable "rancher_image_id" {
  default = "ami-c4255476"
}

variable "rancher_vm_type" {
  default = "tinav3.c4r8p3"
}
