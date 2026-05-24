resource "proxmox_virtual_environment_vm" "ubuntu_vm" {
  name      = "terraform-test"
  node_name = "pmx01"
  vm_id     = 100

  clone {
    vm_id = 9000
    full  = true
  }

  cpu {
    cores = 2
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = 2048
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = 20
  }

  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      username = "ubuntu"
      password = "changeme123"
      keys     = []
    }
  }

  operating_system {
    type = "l26"
  }
}