resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  count     = var.vm_count
  name      = "${var.vm_name}-${count.index + 1}"
  node_name = local.node_name
  vm_id     = 100 + count.index

  clone {
    vm_id = local.template_id
    full  = true
  }

  agent {
    enabled = true
  }

  cpu {
    cores = var.vm_cores
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = var.vm_memory
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = var.vm_disk_size
  }

  initialization {
    ip_config {
      ipv4 {
        address = "192.168.1.${50 + count.index}/24"
        gateway = var.vm_gateway
      }
    }

    user_account {
      username = var.ssh_user
    }
    user_data_file_id = local.cloud_init_id
  }

  operating_system {
    type = "l26"
  }
}

resource "proxmox_virtual_environment_file" "cloud_init" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = local.node_name

  source_raw {
  data = <<-EOF
    #cloud-config
    package_update: true
    package_upgrade: true
    ssh_authorized_keys:
  - ${file(var.ssh_public_key_path)}}
    runcmd:
      - systemctl enable qemu-guest-agent
      - systemctl start qemu-guest-agent
  EOF

  file_name = "cloud-init-${var.vm_name}.yaml"
  }
}