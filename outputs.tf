output "vm_name" {
  description = "Имя VM"
  value       = proxmox_virtual_environment_vm.ubuntu_vm.name
}

output "vm_id" {
  description = "ID VM в Proxmox"
  value       = proxmox_virtual_environment_vm.ubuntu_vm.vm_id
}

output "vm_ipv4" {
  description = "IP адрес VM"
  value       = proxmox_virtual_environment_vm.ubuntu_vm.ipv4_addresses
}