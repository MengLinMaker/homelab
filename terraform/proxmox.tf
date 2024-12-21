provider "proxmox" {
  endpoint = var.proxmox_config.endpoint
  username = var.proxmox_config.username
  password = var.proxmox_config.password
  insecure = true
  ssh {
    agent = true
  }
}
