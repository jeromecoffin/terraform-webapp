resource "outscale_vm" "scdsnabastion" {
  count                          = var.nb_bastion
  image_id                       = var.bastion_image_id
  vm_type                        = var.bastion_vm_type
  placement_tenancy              = "default"
  vm_initiated_shutdown_behavior = "restart"
  performance                    = "medium"
  placement_subregion_name       = "${var.region}a"
  subnet_id                      = outscale_subnet.subnet_1.subnet_id
  security_group_ids             = [outscale_security_group.sg_DSNA.security_group_id]
  private_ips                    = ["10.1.0.5"]
  #volume par défault du root, les volumes supplémentaires sont dans volumes.tf
  block_device_mappings {
    device_name = "/dev/sda1"
    bsu {
      volume_size           = "50"
      iops                  = "150"
      volume_type           = "standard"
      delete_on_vm_deletion = "true"
    }
  }
  tags {
    key   = "name"
    value = "scdsnabastion${count.index + 1}"
  }
}

resource "outscale_vm" "scdsnastorage" {
  count                          = var.nb_storage
  image_id                       = var.storage_image_id
  vm_type                        = var.storage_vm_type
  placement_tenancy              = "default"
  vm_initiated_shutdown_behavior = "restart"
  performance                    = "medium"
  placement_subregion_name       = "${var.region}a"
  subnet_id                      = outscale_subnet.subnet_1.subnet_id
  security_group_ids             = [outscale_security_group.sg_DSNA.security_group_id]
  private_ips                    = ["10.1.0.6${count.index}"]
  #volume par défault du root, les volumes supplémentaires sont dans volumes.tf
  block_device_mappings {
    device_name = "/dev/sda1"
    bsu {
      volume_size           = "50"
      iops                  = "150"
      volume_type           = "standard"
      delete_on_vm_deletion = "true"
    }
  }
  tags {
    key   = "name"
    value = "scdsnastorage${count.index + 1}"
  }
}

resource "outscale_vm" "scdsnadb" {
  count                          = var.nb_db
  image_id                       = var.db_image_id
  vm_type                        = var.db_vm_type
  placement_tenancy              = "default"
  vm_initiated_shutdown_behavior = "restart"
  performance                    = "medium"
  placement_subregion_name       = "${var.region}a"
  subnet_id                      = outscale_subnet.subnet_1.subnet_id
  security_group_ids             = [outscale_security_group.sg_DSNA.security_group_id]
  private_ips                    = ["10.1.0.4${count.index}"]
  #volume par défault du root, les volumes supplémentaires sont dans volumes.tf
  block_device_mappings {
    device_name = "/dev/sda1"
    bsu {
      volume_size           = "50"
      iops                  = "150"
      volume_type           = "standard"
      delete_on_vm_deletion = "true"
    }
  }
  tags {
    key   = "name"
    value = "scdsnadb${count.index + 1}"
  }
}

resource "outscale_vm" "scdsnaws" {
  count                          = var.nb_ws
  image_id                       = var.ws_image_id
  vm_type                        = var.ws_vm_type
  placement_tenancy              = "default"
  vm_initiated_shutdown_behavior = "restart"
  performance                    = "medium"
  placement_subregion_name       = "${var.region}a"
  subnet_id                      = outscale_subnet.subnet_1.subnet_id
  security_group_ids             = [outscale_security_group.sg_DSNA.security_group_id]
  private_ips                    = ["10.1.0.2${count.index}"]
  #volume par défault du root, les volumes supplémentaires sont dans volumes.tf
  block_device_mappings {
    device_name = "/dev/sda1"
    bsu {
      volume_size           = "50"
      iops                  = "150"
      volume_type           = "standard"
      delete_on_vm_deletion = "true"
    }
  }
  tags {
    key   = "name"
    value = "scdsnaws${count.index + 1}"
  }
}

resource "outscale_vm" "scdsnarancher" {
  count                          = var.nb_rancher
  image_id                       = var.rancher_image_id
  vm_type                        = var.rancher_vm_type
  placement_tenancy              = "default"
  vm_initiated_shutdown_behavior = "restart"
  performance                    = "medium"
  placement_subregion_name       = "${var.region}a"
  subnet_id                      = outscale_subnet.subnet_1.subnet_id
  security_group_ids             = [outscale_security_group.sg_DSNA.security_group_id]
  private_ips                    = ["10.1.0.6"]
  #volume par défault du root, les volumes supplémentaires sont dans volumes.tf
  block_device_mappings {
    device_name = "/dev/sda1"
    bsu {
      volume_size           = "50"
      iops                  = "150"
      volume_type           = "standard"
      delete_on_vm_deletion = "true"
    }
  }
  tags {
    key   = "name"
    value = "scdsnarancher${count.index + 1}"
  }
}
