# data "talos_cluster_health" "this" {
#   depends_on           = [talos_machine_configuration_apply.control_plane_config_apply, talos_machine_configuration_apply.worker_config_apply]
#   client_configuration = data.talos_client_configuration.this.client_configuration
#   control_plane_nodes  = [var.talos_cluster_config.control_plane_ip]
#   worker_nodes         = [var.talos_cluster_config.worker_ip]
#   endpoints            = data.talos_client_configuration.this.endpoints
#   timeouts = {
#     read = "30s"
#   }
# }

resource "talos_cluster_kubeconfig" "talos_kubeconfig" {
  # depends_on           = [talos_machine_bootstrap.talos_bootstrap, data.talos_cluster_health.this]
  depends_on           = [talos_machine_bootstrap.talos_bootstrap]
  client_configuration = talos_machine_secrets.this.client_configuration
  node                 = var.talos_cluster_config.control_plane_ip
}
