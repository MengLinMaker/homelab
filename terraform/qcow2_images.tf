# talos - with extensions `qemu-guest-agent` + `tailscale` + `glibc`
resource "proxmox_virtual_environment_download_file" "talos_qcow2" {
  content_type = "iso"
  datastore_id = var.proxmox_config.image_store_id
  node_name    = var.proxmox_config.name
  file_name    = "talos.qcow2.img"
  url          = "https://factory.talos.dev/image/9ee49bb5f44200889652309e9af03195a9ed7a13049dd310180aa00e5ed3a7c2/v1.9.0/nocloud-amd64.qcow2"
  overwrite    = false
}

# debian
resource "proxmox_virtual_environment_download_file" "debian_qcow2" {
  content_type = "iso"
  datastore_id = var.proxmox_config.image_store_id
  node_name    = var.proxmox_config.name
  file_name    = "debian.qcow2.img"
  url          = "https://cdimage.debian.org/images/cloud/bookworm/20241201-1948/debian-12-nocloud-amd64-20241201-1948.qcow2"
  overwrite    = false
}

# almalinux
resource "proxmox_virtual_environment_download_file" "almalinux_qcow2" {
  content_type = "iso"
  datastore_id = var.proxmox_config.image_store_id
  node_name    = var.proxmox_config.name
  file_name    = "almalinux.qcow2.img"
  url          = "https://repo.almalinux.org/almalinux/9/cloud/x86_64/images/AlmaLinux-9-GenericCloud-9.5-20241120.x86_64.qcow2"
  overwrite    = false
}
