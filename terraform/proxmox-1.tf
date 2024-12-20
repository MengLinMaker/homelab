# proxmox-1 server config
variable "proxmox_1_name" {
  description = "The endpoint of the proxmox-1 server"
  type        = string
}

variable "proxmox_1_endpoint" {
  description = "The endpoint of the proxmox-1 server"
  type        = string
}

variable "proxmox_1_username" {
  description = "The username of the proxmox-1 server"
  type        = string
}

variable "proxmox_1_password" {
  description = "The password of the proxmox-1 server"
  type        = string
}

# proxmox_1 node
provider "proxmox" {
  endpoint = var.proxmox_1_endpoint
  username = var.proxmox_1_username
  password = var.proxmox_1_password
  insecure = true
  ssh {
    agent = true
  }
}
