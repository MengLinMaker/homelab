resource "proxmox_virtual_environment_vm" "talos_control_plane_vm" {
  name        = "talos-control-plane"
  description = "Managed by Terraform"
  tags        = ["terraform", "talos", "cp"]
  node_name   = var.proxmox_config.name
  vm_id       = 800

  on_boot = true
  cpu {
    cores = 4
    type  = "x86-64-v2-AES"
  }
  memory {
    dedicated = 4000
    floating  = 4000 # enable memory ballooning
  }
  agent {
    enabled = true
  }
  stop_on_destroy = true
  network_device {
    bridge = "vmbr0"
  }
  disk {
    datastore_id = var.proxmox_config.vm_store_id
    file_id      = proxmox_virtual_environment_download_file.talos_qcow2.id
    file_format  = "raw"
    interface    = "virtio0"
    size         = 10
  }
  operating_system {
    type = "l26" # Linux Kernel 2.6 - 5.X.
  }
  initialization {
    datastore_id = var.proxmox_config.vm_store_id
    ip_config {
      ipv4 {
        address = "${var.talos_cluster_config.control_plane_ip}/24"
        gateway = var.talos_cluster_config.gateway
      }
      ipv6 {
        address = "dhcp"
      }
    }
  }
}

resource "proxmox_virtual_environment_vm" "talos_worker_vm" {
  depends_on  = [proxmox_virtual_environment_vm.talos_control_plane_vm]
  description = "Managed by Terraform"
  name        = "talos-worker"
  tags        = ["terraform", "talos", "worker"]
  node_name   = var.proxmox_config.name
  vm_id       = 900

  on_boot = true
  cpu {
    cores = 12
    type  = "x86-64-v2-AES"
  }
  memory {
    dedicated = 64000
    floating  = 64000 # enable memory ballooning
  }
  agent {
    enabled = true
  }
  stop_on_destroy = true
  network_device {
    bridge = "vmbr0"
  }
  disk {
    datastore_id = var.proxmox_config.vm_store_id
    file_id      = proxmox_virtual_environment_download_file.talos_qcow2.id
    file_format  = "raw"
    interface    = "virtio0"
    size         = 10
  }
  operating_system {
    type = "l26" # Linux Kernel 2.6 - 5.X.
  }
  initialization {
    datastore_id = var.proxmox_config.vm_store_id
    ip_config {
      ipv4 {
        address = "${var.talos_cluster_config.worker_ip}/24"
        gateway = var.talos_cluster_config.gateway
      }
      ipv6 {
        address = "dhcp"
      }
    }
  }
}
