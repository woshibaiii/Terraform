locals {
  environment = "homelab"

  node_name = "pmx01"

  template_id = 9000

  cloud_init_id = proxmox_virtual_environment_file.cloud_init.id
}