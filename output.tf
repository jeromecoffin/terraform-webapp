output "DSNA_vpc_eip" {
  value = outscale_public_ip.eip_DSNA.public_ip
}

output "DSNA_bastion_eip" {
  value = outscale_public_ip.eip_bastion.public_ip
}

output "DSNA_rancher_eip" {
  value = outscale_public_ip.eip_rancher.public_ip
}

output "DSNA_db_ip" {
  value = outscale_vm.scdsnadb[*].private_ips
}

output "DSNA_storage_ip" {
  value = outscale_vm.scdsnastorage[*].private_ips
}

output "DSNA_rancher_ip" {
  value = outscale_vm.scdsnarancher[*].private_ips
}

output "DSNA_bastion_ip" {
  value = outscale_vm.scdsnabastion[*].private_ips
}

output "DSNA_ws_ip" {
  value = outscale_vm.scdsnaws[*].private_ips
}
