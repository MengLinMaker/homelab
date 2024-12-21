# Terraform
This folder holds all the Terraform scripts for provisioning the VMs.

## Deployment
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
