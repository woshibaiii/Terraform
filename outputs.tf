output "vm_names" {
  description = "Имена VM"
  value       = proxmox_virtual_environment_vm.ubuntu_vm[*].name
}

output "vm_ids" {
  description = "ID VM в Proxmox"
  value       = proxmox_virtual_environment_vm.ubuntu_vm[*].vm_id
}

output "vm_ipv4" {
  description = "IP адреса VM"
  value       = proxmox_virtual_environment_vm.ubuntu_vm[*].ipv4_addresses
}