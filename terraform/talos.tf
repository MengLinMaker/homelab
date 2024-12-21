variable "talos_cluster_config" {
  description = "Talos cluster configuration"
  type = object({
    name             = string
    gateway          = string
    control_plane_ip = string
    worker_ip        = string
  })
}

resource "talos_machine_secrets" "this" {}

data "talos_client_configuration" "this" {
  cluster_name         = var.talos_cluster_config.name
  client_configuration = talos_machine_secrets.this.client_configuration
  endpoints            = [var.talos_cluster_config.control_plane_ip]
}

output "talos_config" {
  value     = data.talos_client_configuration.this.talos_config
  sensitive = true
}

output "kube_config" {
  value     = talos_cluster_kubeconfig.talos_kubeconfig.kubeconfig_raw
  sensitive = true
}
