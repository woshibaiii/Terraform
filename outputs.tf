output "vm_ids" {
  value = { for k, vm in proxmox_virtual_environment_vm.ubuntu_vm : vm.name => vm.vm_id }
}

output "vm_ipv4" {
  value = {
    for k, vm in proxmox_virtual_environment_vm.ubuntu_vm : vm.name => flatten([
      for iface in vm.ipv4_addresses : iface
      if !contains(iface, "127.0.0.1")
    ])
  }
}

output "vm_names" {
  value = [ for vm in proxmox_virtual_environment_vm.ubuntu_vm : vm.name ]
}