# Terraform
This folder holds all the Terraform scripts for provisioning the VMs. The config is inspired by [this blog](https://olav.ninja/talos-cluster-on-proxmox-with-terraform)

## Deployment
1. Install dependencies
```bash
brew install terraform tfsec siderolabs/tap/talosctl

pnpm i
```
2. Provide env variables:
  - `terraform login`
  - Create `terraform.tfvars` according the `variables.tf`
3. Deploy
```bash
pnpm dep
```
