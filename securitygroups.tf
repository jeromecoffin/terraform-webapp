resource "outscale_security_group" "sg_DSNA" {
  description         = "Security Group for DSNA"
  security_group_name = "DSNA"
  net_id              = outscale_net.vpc_DSNA.net_id
}

resource "outscale_security_group_rule" "sg_rule_0" {
  flow              = "Outbound"
  security_group_id = outscale_security_group.sg_DSNA.security_group_id
  ip_protocol       = "-1"
  ip_range          = "0.0.0.0/0"
}

resource "outscale_security_group_rule" "sg_rule_1" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_DSNA.security_group_id
  from_port_range   = "80"
  to_port_range     = "80"
  ip_protocol       = "tcp"
  ip_range          = "51.15.190.162/32"
}

resource "outscale_security_group_rule" "sg_rule_2" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_DSNA.security_group_id
  from_port_range   = "443"
  to_port_range     = "443"
  ip_protocol       = "tcp"
  ip_range          = "51.15.190.162/32"
}

resource "outscale_security_group_rule" "sg_rule_3" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_DSNA.security_group_id
  from_port_range   = "722"
  to_port_range     = "722"
  ip_protocol       = "tcp"
  ip_range          = "51.15.190.162/32"
}

resource "outscale_security_group_rule" "sg_rule_4" {
  flow              = "Inbound"
  security_group_id = outscale_security_group.sg_DSNA.security_group_id
  from_port_range   = "9090"
  to_port_range     = "9090"
  ip_protocol       = "tcp"
  ip_range          = "51.15.190.162/32"
}
