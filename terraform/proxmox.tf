variable "proxmox_config" {
  description = "Proxmox configuration"
  type = object({
    name     = string
    endpoint = string
    username = string
    password = string
  })
}

provider "proxmox" {
  endpoint = var.proxmox_config.endpoint
  username = var.proxmox_config.username
  password = var.proxmox_config.password
  insecure = true
  ssh {
    agent = true
  }
}
