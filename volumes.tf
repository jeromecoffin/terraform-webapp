resource "outscale_volume" "volume_db" {
  count          = var.nb_db
  subregion_name = "${var.region}a"
  size           = 150
  iops           = 5000
  volume_type    = "io1"
  tags {
    key   = "name"
    value = "db${count.index}_volume"
  }
}

resource "outscale_volumes_link" "volume_link_db" {
  count       = var.nb_db
  device_name = "bootdisk"
  volume_id   = outscale_volume.volume_db[count.index].id
  vm_id       = outscale_vm.scdsnadb[count.index].id
}

resource "outscale_volume" "volume_storage" {
  count          = var.nb_storage
  subregion_name = "${var.region}a"
  size           = 50
  iops           = 150
  volume_type    = "standard"
  tags {
    key   = "name"
    value = "storage${count.index}_volume"
  }
}

resource "outscale_volumes_link" "volume_link_storage" {
  count       = var.nb_storage
  device_name = "bootdisk"
  volume_id   = outscale_volume.volume_storage[count.index].id
  vm_id       = outscale_vm.scdsnastorage[count.index].id
}

resource "outscale_volume" "volume_ws" {
  count          = var.nb_ws
  subregion_name = "${var.region}a"
  size           = 150
  iops           = 5000
  volume_type    = "io1"
  tags {
    key   = "name"
    value = "ws${count.index}_volume"
  }
}

resource "outscale_volumes_link" "volume_link_ws" {
  count       = var.nb_ws
  device_name = "bootdisk"
  volume_id   = outscale_volume.volume_ws[count.index].id
  vm_id       = outscale_vm.scdsnaws[count.index].id
}

resource "outscale_volume" "volume_rancher" {
  count          = var.nb_rancher
  subregion_name = "${var.region}a"
  size           = 50
  iops           = 150
  volume_type    = "standard"
  tags {
    key   = "name"
    value = "rancher${count.index}_volume"
  }
}

resource "outscale_volumes_link" "volume_link_rancher" {
  count       = var.nb_rancher
  device_name = "bootdisk"
  volume_id   = outscale_volume.volume_rancher[count.index].id
  vm_id       = outscale_vm.scdsnarancher[count.index].id
}

resource "outscale_volume" "volume_bastion" {
  count          = var.nb_bastion
  subregion_name = "${var.region}a"
  size           = 50
  iops           = 150
  volume_type    = "standard"
  tags {
    key   = "name"
    value = "bastion${count.index}"
  }
}

resource "outscale_volumes_link" "volume_link_bastion" {
  count       = var.nb_bastion
  device_name = "bootdisk"
  volume_id   = outscale_volume.volume_bastion[count.index].id
  vm_id       = outscale_vm.scdsnabastion[count.index].id
}
