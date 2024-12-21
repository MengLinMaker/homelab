# MengLinMaker's homelab
My homelab setup with Dell PowerEdge R730 running Proxmox, Talos and K0s, provisioned with kubernetes.

## Quick start
1. Install dependencies
```bash
brew install terraform tfsec
pnpm i
```
2. Deploy
```bash
pnpm dep
```

_Note: may need to login to terraform_
```bash
terraform login
```

## Layout
Folder structure:
- `docs` - helpful commands
- `kubernetes` - all the kubernetes related configs
- `terraform` - config for deploying infra on proxmox
