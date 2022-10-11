variable "region" {
  type    = string
  default = "cloudgouv-eu-west-1"
}

variable "outscale_access_key" {
  default = ""
}

variable "outscale_secret_key" {
  default = ""
}

variable "vpc_ip_range" {
  type    = string
  default = "10.1.0.0/16"
}

variable "subnet_ip_range" {
  type    = string
  default = "10.1.0.0/24"
}

variable "sg_inbound_vpn_prod" {
  description = "Security group inbound ports"
  type        = list(number)
  default     = [80, 443, 722, 9090]
}

variable "alphabet" {
  description = "alphabet for device"
  type        = list(string)
  default     = ["b", "c", "d", "e", "f", "g"]
}

variable "nb_bastion" {
  default = 1
}

variable "bastion_image_id" {
  default = "ami-6f0f9ef3"
}

variable "bastion_vm_type" {
  default = "tinav3.c1r2p3"
}

variable "nb_volume_per_bastion" {
  default = 1
}

variable "nb_storage" {
  default = 3
}

variable "nb_volume_per_storage" {
  default = 6
}

variable "storage_image_id" {
  default = "ami-6f0f9ef3"
}

variable "storage_vm_type" {
  default = "tinav3.c4r12p2"
}

variable "nb_db" {
  default = 1
}

variable "db_image_id" {
  default = "ami-6f0f9ef3"
}

variable "db_vm_type" {
  default = "tinav3.c8r20p3"
}

variable "nb_volume_per_db" {
  default = 1
}

variable "nb_ws" {
  default = 3
}

variable "ws_image_id" {
  default = "ami-6f0f9ef3"
}

variable "ws_vm_type" {
  default = "tinav3.c4r8p3"
}

variable "nb_volume_per_ws" {
  default = 1
}

variable "nb_rancher" {
  default = 1
}

variable "rancher_image_id" {
  default = "ami-6f0f9ef3"
}

variable "rancher_vm_type" {
  default = "tinav3.c4r8p3"
}

variable "nb_volume_per_rancher" {
  default = 2
}
