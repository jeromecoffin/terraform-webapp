resource "outscale_volume" "volume_db_1" {
  subregion_name = "${var.region}a"
  size           = 150
  iops           = 5000
  volume_type    = "io1"
  tags {
    key   = "name"
    value = "db_1"
  }
}

resource "outscale_volumes_link" "volume_link_db_1" {
  device_name = "bootdisk"
  volume_id   = outscale_volume.volume_db_1.id
  vm_id       = outscale_vm.scdsnadb1.id
}

resource "outscale_volume" "volume_storage_1" {
  subregion_name = "${var.region}a"
  size           = 150
  iops           = 5000
  volume_type    = "io1"
  tags {
    key   = "name"
    value = "storage_1"
  }
}

resource "outscale_volume" "volume_storage_2" {
  subregion_name = "${var.region}a"
  size           = 150
  iops           = 5000
  volume_type    = "io1"
  tags {
    key   = "name"
    value = "storage_2"
  }
}

resource "outscale_volume" "volume_storage_3" {
  subregion_name = "${var.region}a"
  size           = 150
  iops           = 5000
  volume_type    = "io1"
  tags {
    key   = "name"
    value = "storage_3"
  }
}

resource "outscale_volume" "volume_storage_4" {
  subregion_name = "${var.region}a"
  size           = 150
  iops           = 5000
  volume_type    = "io1"
  tags {
    key   = "name"
    value = "storage_4"
  }
}

resource "outscale_volume" "volume_storage_5" {
  subregion_name = "${var.region}a"
  size           = 150
  iops           = 5000
  volume_type    = "io1"
  tags {
    key   = "name"
    value = "storage_5"
  }
}

resource "outscale_volume" "volume_storage_6" {
  subregion_name = "${var.region}a"
  size           = 150
  iops           = 5000
  volume_type    = "io1"
  tags {
    key   = "name"
    value = "storage_6"
  }
}

resource "outscale_volume" "volume_ws_1" {
  subregion_name = "${var.region}a"
  size           = 150
  iops           = 5000
  volume_type    = "io1"
  tags {
    key   = "name"
    value = "ws_1"
  }
}

resource "outscale_volume" "volume_ws_2" {
  subregion_name = "${var.region}a"
  size           = 150
  iops           = 5000
  volume_type    = "io1"
  tags {
    key   = "name"
    value = "ws_2"
  }
}

resource "outscale_volume" "volume_ws_3" {
  subregion_name = "${var.region}a"
  size           = 150
  iops           = 5000
  volume_type    = "io1"
  tags {
    key   = "name"
    value = "ws_3"
  }
}

resource "outscale_volume" "volume_rancher_1" {
  subregion_name = "${var.region}a"
  size           = 150
  iops           = 5000
  volume_type    = "io1"
  tags {
    key   = "name"
    value = "rancher_1"
  }
}

resource "outscale_volume" "volume_rancher_2" {
  subregion_name = "${var.region}a"
  size           = 150
  iops           = 5000
  volume_type    = "io1"
  tags {
    key   = "name"
    value = "rancher_2"
  }
}

resource "outscale_volume" "volume_bastion_1" {
  subregion_name = "${var.region}a"
  size           = 150
  iops           = 5000
  volume_type    = "io1"
  tags {
    key   = "name"
    value = "bastion_1"
  }
}

resource "outscale_volumes_link" "volume_link_bastion_1" {
  device_name = "bootdisk"
  volume_id   = outscale_volume.volume_bastion_1.id
  vm_id       = outscale_vm.scdsnabastion1.id
}
