# Il existe un volume par défaut attaché à la vm sur le bootdisk sda1
# Si le nombre de volume par vm est supérieur à 1, alors on créé le nombre de volume nécessaire moins ceux par défault

resource "outscale_volume" "volume_db" {
  count          = var.nb_volume_per_db > 1 ? length(outscale_vm.scdsnadb) * var.nb_volume_per_db - length(outscale_vm.scdsnadb) : 0
  subregion_name = "${var.region}a"
  size           = 150
  iops           = 5000
  volume_type    = "io1"
  tags {
    key   = "name"
    value = "db_volume${count.index + 1}"
  }
}

/*resource "outscale_volumes_link" "volume_link_db" {
  count       = var.nb_volume_per_db > 1 ? length(outscale_volume.volume_db) : 0
  device_name = ""
  volume_id   = outscale_volume.volume_db[count.index].id
  vm_id       = outscale_vm.scdsnadb[count.index % length(outscale_vm.scdsnadb)].id
}*/

resource "outscale_volume" "volume_storage" {
  count          = var.nb_volume_per_storage > 1 ? length(outscale_vm.scdsnastorage) * var.nb_volume_per_storage - length(outscale_vm.scdsnastorage) : 0
  subregion_name = "${var.region}a"
  size           = 50
  iops           = 150
  volume_type    = "standard"
  tags {
    key   = "name"
    value = "storage_volume${count.index + 1}"
  }
}

/*resource "outscale_volumes_link" "volume_link_storage" {
  count       = var.nb_volume_per_storage > 1 ? length(outscale_volume.volume_storage) : 0
  device_name = ""
  volume_id   = outscale_volume.volume_storage[count.index].id
  vm_id       = outscale_vm.scdsnastorage[count.index % length(outscale_vm.scdsnastorage)].id
}*/

resource "outscale_volume" "volume_ws" {
  count          = var.nb_volume_per_ws > 1 ? length(outscale_vm.scdsnaws) * var.nb_volume_per_ws - length(outscale_vm.scdsnaws) : 0
  subregion_name = "${var.region}a"
  size           = 150
  iops           = 5000
  volume_type    = "io1"
  tags {
    key   = "name"
    value = "ws_volume${count.index + 1}"
  }
}

/*resource "outscale_volumes_link" "volume_link_ws" {
  count       = var.nb_volume_per_ws > 1 ? length(outscale_volume.volume_ws) : 0
  device_name = ""
  volume_id   = outscale_volume.volume_ws[count.index].id
  vm_id       = outscale_vm.scdsnaws[count.index % length(outscale_vm.scdsnaws)].id
}*/

resource "outscale_volume" "volume_rancher" {
  count          = var.nb_volume_per_rancher > 1 ? length(outscale_vm.scdsnarancher) * var.nb_volume_per_rancher - length(outscale_vm.scdsnarancher) : 0
  subregion_name = "${var.region}a"
  size           = 50
  iops           = 150
  volume_type    = "standard"
  tags {
    key   = "name"
    value = "rancher_volume${count.index + 1}"
  }
}

/*resource "outscale_volumes_link" "volume_link_rancher" {
  count       = var.nb_volume_per_rancher > 1 ? length(outscale_volume.volume_rancher) : 0
  device_name = ""
  volume_id   = outscale_volume.volume_rancher[count.index].id
  vm_id       = outscale_vm.scdsnarancher[count.index % length(outscale_vm.scdsnarancher)].id
}*/

resource "outscale_volume" "volume_bastion" {
  count          = var.nb_volume_per_bastion > 1 ? length(outscale_vm.scdsnabastion) * var.nb_volume_per_bastion - length(outscale_vm.scdsnabastion) : 0
  subregion_name = "${var.region}a"
  size           = 50
  iops           = 150
  volume_type    = "standard"
  tags {
    key   = "name"
    value = "bastion_volume${count.index + 1}"
  }
}

/*resource "outscale_volumes_link" "volume_link_bastion" {
  count       = var.nb_volume_per_bastion > 1 ? length(outscale_volume.volume_bastion) : 0
  device_name = ""
  volume_id   = outscale_volume.volume_bastion[count.index].id
  vm_id       = outscale_vm.scdsnabastion[count.index % length(outscale_vm.scdsnabastion)].id
}*/
