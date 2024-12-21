# talos - with extensions `qemu-guest-agent` + `glibc`
resource "proxmox_virtual_environment_download_file" "talos_qcow2" {
  content_type = "iso"
  datastore_id = var.proxmox_config.image_store_id
  node_name    = var.proxmox_config.name
  file_name    = "talos.qcow2.img"
  url          = "https://factory.talos.dev/image/a98370e8bc36e336e1de99db6bbc23b8a0ae03820a474d8a2e964cfeaece9922/v1.9.0/nocloud-amd64.qcow2"
  overwrite    = true
}
