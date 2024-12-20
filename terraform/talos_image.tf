locals {
  talos = {
    version = "v1.9.0"
  }
}

# talos with extensions `qemu-guest-agent` + `tailscale` + `glibc`
resource "proxmox_virtual_environment_download_file" "talos_image" {
  content_type            = "iso"
  datastore_id            = "local"
  node_name               = var.proxmox_config.name
  file_name               = "talos-${local.talos.version}-nocloud-amd64.img"
  url                     = "https://factory.talos.dev/image/9ee49bb5f44200889652309e9af03195a9ed7a13049dd310180aa00e5ed3a7c2/${local.talos.version}/nocloud-amd64.raw.gz"
  decompression_algorithm = "gz"
  overwrite               = false
}
