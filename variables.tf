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

variable "sg_inbound_ports" {
  description = "Security groups inbound ports"
  type        = list(number)
  default     = [80, 443, 722, 9090]
}
/*
bastion {
    nb_vm         = 1
    image_id      = "ami-c4255476"
    vm_type       = "tinav3.c1r2p3"
    volume_per_vm = 1
  }
}
*/
variable "nb_bastion" {
  default = 1
}

variable "bastion_image_id" {
  default = "ami-c4255476"
}

variable "bastion_vm_type" {
  default = "tinav3.c1r2p3"
}

variable "nb_storage" {
  default = 3
}

variable "nb_volume_per_storage" {
  default = 3
}

variable "storage_image_id" {
  default = "ami-c4255476"
}

variable "storage_vm_type" {
  default = "tinav3.c4r12p2"
}

variable "nb_db" {
  default = 1
}
variable "db_image_id" {
  default = "ami-c4255476"
}

variable "db_vm_type" {
  default = "tinav3.c8r20p3	"
}

variable "nb_ws" {
  default = 3
}

variable "ws_image_id" {
  default = "ami-c4255476"
}

variable "ws_vm_type" {
  default = "tinav3.c12r62p3"
}

variable "nb_rancher" {
  default = 1
}

variable "rancher_image_id" {
  default = "ami-c4255476"
}

variable "rancher_vm_type" {
  default = "tinav3.c4r8p3"
}
