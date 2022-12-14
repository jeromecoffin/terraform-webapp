/*resource "outscale_net" "vpc_BACKUP" {
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
  gateway_id           = outscale_nat_service.nat_BACKUP.nat_service_id
  route_table_id       = outscale_route_table.rt_BACKUP.route_table_id
}

resource "outscale_route_table_link" "rt_link_BACKUP" {
  subnet_id      = outscale_subnet.subnet_BACKUP.subnet_id
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

resource "outscale_volume" "volume_backup" {
  count          = 4
  subregion_name = "${var.region}b"
  size           = 1000
  iops           = 150
  volume_type    = "standard"
  tags {
    key   = "name"
    value = "backup_volume${count.index + 1}"
  }
}

resource "outscale_volumes_link" "volume_link_backup" {
  count       = 4
  device_name = "/dev/xvd${var.alphabet[count.index]}"
  volume_id   = outscale_volume.volume_backup[count.index].id
  vm_id       = outscale_vm.scdsnaBACKUP.id
}

resource "outscale_security_group" "sg_BACKUP" {
  description         = "Security Group for BACKUP"
  security_group_name = "BACKUP"
  net_id              = outscale_net.vpc_BACKUP.net_id
}

resource "outscale_security_group_rule" "sg_rule_inbound_BACKUP" {
  count             = length(var.sg_inbound_vpn_prod)
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_BACKUP.security_group_id
  from_port_range   = var.sg_inbound_vpn_prod[count.index]
  to_port_range     = var.sg_inbound_vpn_prod[count.index]
  ip_protocol       = "tcp"
  ip_range          = "51.15.190.162/32"
}

resource "outscale_security_group_rule" "sg_rule_inbound_DSNA_to_BACKUP" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_BACKUP.security_group_id
  from_port_range   = "9000"
  to_port_range     = "9000"
  ip_protocol       = "tcp"
  ip_range          = "10.1.0.0/16"
}
*/
