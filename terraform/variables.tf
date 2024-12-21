variable "proxmox_config" {
  description = "Proxmox configuration"
  type = object({
    name           = string
    endpoint       = string
    username       = string
    password       = string
    image_store_id = string
    vm_store_id    = string
  })
}

variable "talos_cluster_config" {
  description = "Talos cluster configuration"
  type = object({
    name             = string
    gateway          = string
    control_plane_ip = string
    worker_ip        = string
  })
}
