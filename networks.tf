resource "outscale_net" "vpc_DSNA" {
  ip_range = var.vpc_ip_range
  tenancy  = "default"
  tags {
    key   = "name"
    value = "DSNA"
  }
}

resource "outscale_subnet" "subnet_1" {
  net_id   = outscale_net.vpc_DSNA.net_id
  ip_range = var.subnet_ip_range
  tags {
    key   = "name"
    value = "1"
  }
}

resource "outscale_public_ip" "eip_DSNA" {
  tags {
    key   = "name"
    value = "DSNA"
  }
}

resource "outscale_nat_service" "nat_DSNA" {
  subnet_id    = outscale_subnet.subnet_1.subnet_id
  public_ip_id = outscale_public_ip.eip_DSNA.public_ip_id
  tags {
    key   = "name"
    value = "DSNA"
  }
}

resource "outscale_route_table" "rt_DSNA" {
  net_id = outscale_net.vpc_DSNA.net_id
  tags {
    key   = "name"
    value = "DSNA"
  }
}

resource "outscale_route" "route_1" {
  destination_ip_range = "0.0.0.0/0"
  gateway_id           = outscale_internet_service.is_DSNA.internet_service_id
  route_table_id       = outscale_route_table.rt_DSNA.route_table_id
}

resource "outscale_route_table_link" "rt_link_1" {
  subnet_id      = outscale_subnet.subnet_1.subnet_id
  route_table_id = outscale_route_table.rt_DSNA.id
}

resource "outscale_internet_service" "is_DSNA" {
}

resource "outscale_internet_service_link" "is_link_1" {
  net_id              = outscale_net.vpc_DSNA.net_id
  internet_service_id = outscale_internet_service.is_DSNA.id
}

resource "outscale_public_ip" "eip_bastion" {
  tags {
    key   = "name"
    value = "DSNA_bastion"
  }
}

resource "outscale_public_ip_link" "eip_bastion_link" {
  vm_id     = outscale_vm.scdsnabastion[0].vm_id
  public_ip = outscale_public_ip.eip_bastion.public_ip
}

resource "outscale_public_ip" "eip_rancher" {
  tags {
    key   = "name"
    value = "DSNA_rancher"
  }
}

resource "outscale_public_ip_link" "eip_rancher_link" {
  vm_id     = outscale_vm.scdsnarancher[0].vm_id
  public_ip = outscale_public_ip.eip_rancher.public_ip
}
