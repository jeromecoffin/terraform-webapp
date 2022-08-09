resource "outscale_volume" "volume_db" {
  count          = length(outscale_vm.scdsnadb) * var.nb_volume_per_db
  subregion_name = "${var.region}a"
  size           = 150
  iops           = 5000
  volume_type    = "io1"
  tags {
    key   = "name"
    value = "db_volume${count.index}"
  }
}

resource "outscale_volumes_link" "volume_link_db" {
  count       = length(outscale_volume.volume_db)
  device_name = "bootdisk"
  volume_id   = outscale_volume.volume_db[count.index].id
  vm_id       = outscale_vm.scdsnadb[count.index % length(outscale_vm.scdsnadb)].id
}

resource "outscale_volume" "volume_storage" {
  count          = length(outscale_vm.scdsnastorage) * var.nb_volume_per_storage
  subregion_name = "${var.region}a"
  size           = 50
  iops           = 150
  volume_type    = "standard"
  tags {
    key   = "name"
    value = "storage_volume${count.index}"
  }
}

resource "outscale_volumes_link" "volume_link_storage" {
  count       = length(outscale_volume.volume_storage)
  device_name = "bootdisk"
  volume_id   = outscale_volume.volume_storage[count.index].id
  vm_id       = outscale_vm.scdsnastorage[count.index % length(outscale_vm.scdsnastorage)].id
}

resource "outscale_volume" "volume_ws" {
  count          = length(outscale_vm.scdsnaws) * var.nb_volume_per_ws
  subregion_name = "${var.region}a"
  size           = 150
  iops           = 5000
  volume_type    = "io1"
  tags {
    key   = "name"
    value = "ws_volume${count.index}"
  }
}

resource "outscale_volumes_link" "volume_link_ws" {
  count       = length(outscale_volume.volume_ws)
  device_name = "bootdisk"
  volume_id   = outscale_volume.volume_ws[count.index].id
  vm_id       = outscale_vm.scdsnaws[count.index % length(outscale_vm.scdsnaws)].id
}

resource "outscale_volume" "volume_rancher" {
  count          = length(outscale_vm.scdsnarancher) * var.nb_volume_per_rancher
  subregion_name = "${var.region}a"
  size           = 50
  iops           = 150
  volume_type    = "standard"
  tags {
    key   = "name"
    value = "rancher_volume${count.index}"
  }
}

resource "outscale_volumes_link" "volume_link_rancher" {
  count       = length(outscale_volume.volume_rancher)
  device_name = "bootdisk"
  volume_id   = outscale_volume.volume_rancher[count.index].id
  vm_id       = outscale_vm.scdsnarancher[count.index % length(outscale_vm.scdsnarancher)].id
}

resource "outscale_volume" "volume_bastion" {
  count          = length(outscale_vm.scdsnabastion) * var.nb_volume_per_bastion
  subregion_name = "${var.region}a"
  size           = 50
  iops           = 150
  volume_type    = "standard"
  tags {
    key   = "name"
    value = "bastion_volume${count.index}"
  }
}

resource "outscale_volumes_link" "volume_link_bastion" {
  count       = length(outscale_volume.volume_bastion)
  device_name = "bootdisk"
  volume_id   = outscale_volume.volume_bastion[count.index].id
  vm_id       = outscale_vm.scdsnabastion[count.index % length(outscale_vm.scdsnabastion)].id
}
