resource "outscale_net" "vpc_BACKUP" {
  ip_range = "10.2.0.0/16"
  tenancy  = "default"
  tags {
    key   = "name"
    value = "BACKUP"
  }
}

resource "outscale_subnet" "subnet_BACKUP" {
  net_id         = outscale_net.vpc_BACKUP.net_id
  ip_range       = "10.2.0.0/24"
  subregion_name = "${var.region}b"
  tags {
    key   = "name"
    value = "1"
  }
}

resource "outscale_public_ip" "eip_BACKUP" {
  tags {
    key   = "name"
    value = "BACKUP"
  }
}

resource "outscale_nat_service" "nat_BACKUP" {
  subnet_id    = outscale_subnet.subnet_BACKUP.subnet_id
  public_ip_id = outscale_public_ip.eip_BACKUP.public_ip_id
  tags {
    key   = "name"
    value = "BACKUP"
  }
}

resource "outscale_route_table" "rt_BACKUP" {
  net_id = outscale_net.vpc_BACKUP.net_id
  tags {
    key   = "name"
    value = "BACKUP"
  }
}

resource "outscale_route" "route_BACKUP" {
  destination_ip_range = "0.0.0.0/0"
  gateway_id           = outscale_internet_service.is_BACKUP.internet_service_id
  route_table_id       = outscale_route_table.rt_BACKUP.route_table_id
}

resource "outscale_route_table_link" "rt_link_BACKUP" {
  subnet_id      = outscale_subnet.subnet_1.subnet_id
  route_table_id = outscale_route_table.rt_BACKUP.id
}

resource "outscale_internet_service" "is_BACKUP" {
}

resource "outscale_internet_service_link" "is_link_BACKUP" {
  net_id              = outscale_net.vpc_BACKUP.net_id
  internet_service_id = outscale_internet_service.is_BACKUP.id
}

resource "outscale_vm" "scdsnaBACKUP" {
  image_id                       = "ami-6f0f9ef3"
  vm_type                        = "tinav3.c4r10p3"
  placement_tenancy              = "default"
  vm_initiated_shutdown_behavior = "restart"
  placement_subregion_name       = "${var.region}b"
  subnet_id                      = outscale_subnet.subnet_BACKUP.subnet_id
  security_group_ids             = [outscale_security_group.sg_BACKUP.security_group_id]
  private_ips                    = ["10.2.0.5"]
  tags {
    key   = "name"
    value = "scdsnabackup"
  }
}

resource "outscale_net_peering" "net_peering_BACKUP" {
  accepter_net_id = outscale_net.vpc_BACKUP.net_id
  source_net_id   = outscale_net.vpc_DSNA.net_id
  tags {
    key   = "name"
    value = "backup"
  }
}

resource "outscale_net_peering_acceptation" "net_peering_acceptation" {
  net_peering_id = outscale_net_peering.net_peering_BACKUP.net_peering_id
}

resource "outscale_route" "route_DSNA_to_BACKUP" {
  destination_ip_range = "10.1.0.0/16"
  net_peering_id       = outscale_net_peering.net_peering_BACKUP.id
  route_table_id       = outscale_route_table.rt_BACKUP.route_table_id
}
