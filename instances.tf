resource "outscale_vm" "scdsnabastion1" {
  image_id                       = var.bastion_image_id
  vm_type                        = var.bastion_vm_type
  placement_tenancy              = "default"
  vm_initiated_shutdown_behavior = "restart"
  performance                    = "medium"
  placement_subregion_name       = "${var.region}a"
  subnet_id                      = outscale_subnet.subnet_1.subnet_id
  security_group_ids             = [outscale_security_group.sg_DSNA.security_group_id]
  private_ips                    = ["10.1.0.5"]
  tags {
    key   = "name"
    value = "scdsnabastion1"
  }
}

resource "outscale_vm" "scdsnastorage1" {
  image_id                       = var.storage_image_id
  vm_type                        = var.storage_vm_type
  placement_tenancy              = "default"
  vm_initiated_shutdown_behavior = "restart"
  performance                    = "medium"
  placement_subregion_name       = "${var.region}a"
  subnet_id                      = outscale_subnet.subnet_1.subnet_id
  security_group_ids             = [outscale_security_group.sg_DSNA.security_group_id]
  private_ips                    = ["10.1.0.60"]
  tags {
    key   = "name"
    value = "scdsnastorage1"
  }
}

resource "outscale_vm" "scdsnastorage2" {
  image_id                       = var.storage_image_id
  vm_type                        = var.storage_vm_type
  placement_tenancy              = "default"
  vm_initiated_shutdown_behavior = "restart"
  performance                    = "medium"
  placement_subregion_name       = "${var.region}a"
  subnet_id                      = outscale_subnet.subnet_1.subnet_id
  security_group_ids             = [outscale_security_group.sg_DSNA.security_group_id]
  private_ips                    = ["10.1.0.61"]
  tags {
    key   = "name"
    value = "scdsnastorage2"
  }
}

resource "outscale_vm" "scdsnastorage3" {
  image_id                       = var.storage_image_id
  vm_type                        = var.storage_vm_type
  placement_tenancy              = "default"
  vm_initiated_shutdown_behavior = "restart"
  performance                    = "medium"
  placement_subregion_name       = "${var.region}a"
  subnet_id                      = outscale_subnet.subnet_1.subnet_id
  security_group_ids             = [outscale_security_group.sg_DSNA.security_group_id]
  private_ips                    = ["10.1.0.62"]
  tags {
    key   = "name"
    value = "scdsnastorage3"
  }
}

resource "outscale_vm" "scdsnadb1" {
  image_id                       = var.db_image_id
  vm_type                        = var.db_vm_type
  placement_tenancy              = "default"
  vm_initiated_shutdown_behavior = "restart"
  performance                    = "medium"
  placement_subregion_name       = "${var.region}a"
  subnet_id                      = outscale_subnet.subnet_1.subnet_id
  security_group_ids             = [outscale_security_group.sg_DSNA.security_group_id]
  private_ips                    = ["10.1.0.40"]
  tags {
    key   = "name"
    value = "scdsnadb1"
  }
}

resource "outscale_vm" "scdsnaws1" {
  image_id                       = var.ws_image_id
  vm_type                        = var.ws_vm_type
  placement_tenancy              = "default"
  vm_initiated_shutdown_behavior = "restart"
  performance                    = "medium"
  placement_subregion_name       = "${var.region}a"
  subnet_id                      = outscale_subnet.subnet_1.subnet_id
  security_group_ids             = [outscale_security_group.sg_DSNA.security_group_id]
  private_ips                    = ["10.1.0.20"]
  tags {
    key   = "name"
    value = "scdsnaws1"
  }
}

resource "outscale_vm" "scdsnaws2" {
  image_id                       = var.ws_image_id
  vm_type                        = var.ws_vm_type
  placement_tenancy              = "default"
  vm_initiated_shutdown_behavior = "restart"
  performance                    = "medium"
  placement_subregion_name       = "${var.region}a"
  subnet_id                      = outscale_subnet.subnet_1.subnet_id
  security_group_ids             = [outscale_security_group.sg_DSNA.security_group_id]
  private_ips                    = ["10.1.0.21"]
  tags {
    key   = "name"
    value = "scdsnaws2"
  }
}

resource "outscale_vm" "scdsnaws3" {
  image_id                       = var.ws_image_id
  vm_type                        = var.ws_vm_type
  placement_tenancy              = "default"
  vm_initiated_shutdown_behavior = "restart"
  performance                    = "medium"
  placement_subregion_name       = "${var.region}a"
  subnet_id                      = outscale_subnet.subnet_1.subnet_id
  security_group_ids             = [outscale_security_group.sg_DSNA.security_group_id]
  private_ips                    = ["10.1.0.22"]
  tags {
    key   = "name"
    value = "scdsnaws3"
  }
}

resource "outscale_vm" "scdsnarancher1" {
  image_id                       = var.rancher_image_id
  vm_type                        = var.rancher_vm_type
  placement_tenancy              = "default"
  vm_initiated_shutdown_behavior = "restart"
  performance                    = "medium"
  placement_subregion_name       = "${var.region}a"
  subnet_id                      = outscale_subnet.subnet_1.subnet_id
  security_group_ids             = [outscale_security_group.sg_DSNA.security_group_id]
  private_ips                    = ["10.1.0.6"]
  tags {
    key   = "name"
    value = "scdsnarancher1"
  }
}
