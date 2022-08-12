resource "outscale_security_group" "sg_DSNA" {
  description         = "Security Group for DSNA"
  security_group_name = "DSNA"
  net_id              = outscale_net.vpc_DSNA.net_id
}
/*
resource "outscale_security_group_rule" "sg_rule_0" {
  flow              = "Outbound"
  security_group_id = outscale_security_group.sg_DSNA.security_group_id
  ip_protocol       = "-1"
  ip_range          = "0.0.0.0/0"
}*/

resource "outscale_security_group_rule" "sg_rule_inbound" {
  count             = length(var.sg_inbound_vpn_prod)
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_DSNA.security_group_id
  from_port_range   = var.sg_inbound_vpn_prod[count.index]
  to_port_range     = var.sg_inbound_vpn_prod[count.index]
  ip_protocol       = "tcp"
  ip_range          = "51.15.190.162/32"
}
