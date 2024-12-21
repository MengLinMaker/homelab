data "talos_machine_configuration" "control_plane" {
  machine_type     = "controlplane"
  cluster_name     = var.talos_cluster_config.name
  cluster_endpoint = "https://${var.talos_cluster_config.control_plane_ip}:6443"
  machine_secrets  = talos_machine_secrets.this.machine_secrets
}

data "talos_machine_configuration" "worker" {
  machine_type     = "worker"
  cluster_name     = var.talos_cluster_config.name
  cluster_endpoint = "https://${var.talos_cluster_config.control_plane_ip}:6443"
  machine_secrets  = talos_machine_secrets.this.machine_secrets
}

resource "talos_machine_configuration_apply" "control_plane_config_apply" {
  depends_on                  = [proxmox_virtual_environment_vm.talos_control_plane_vm]
  client_configuration        = talos_machine_secrets.this.client_configuration
  machine_configuration_input = data.talos_machine_configuration.control_plane.machine_configuration
  count                       = 1
  node                        = var.talos_cluster_config.control_plane_ip
}

resource "talos_machine_configuration_apply" "worker_config_apply" {
  depends_on                  = [proxmox_virtual_environment_vm.talos_worker_vm]
  client_configuration        = talos_machine_secrets.this.client_configuration
  machine_configuration_input = data.talos_machine_configuration.worker.machine_configuration
  count                       = 1
  node                        = var.talos_cluster_config.worker_ip
}

resource "talos_machine_bootstrap" "talos_bootstrap" {
  depends_on           = [talos_machine_configuration_apply.control_plane_config_apply]
  client_configuration = talos_machine_secrets.this.client_configuration
  node                 = var.talos_cluster_config.control_plane_ip
}
