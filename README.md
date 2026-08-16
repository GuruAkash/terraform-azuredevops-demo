# Terraform Infrastructure Provisioning via Azure DevOps

Azure infrastructure defined as code with Terraform and provisioned through an Azure DevOps
YAML pipeline, so environment changes go through the same reviewed, version-controlled path
as application code.

---

## What this does

```
Git commit to terraform/
    │
    ▼
azure-pipelines.yml
    ├── terraform init      — initialise backend and providers
    ├── terraform validate  — catch configuration errors before planning
    ├── terraform plan      — produce and publish the change plan
    └── terraform apply     — apply the approved plan
    │
    ▼
Azure resources
```

Running `plan` as its own stage means the proposed change is reviewable before anything is
applied, which is the point of doing this in a pipeline rather than from a laptop.

---

## Repository layout

| Path | Purpose |
|---|---|
| `terraform/` | Terraform configuration — resource definitions, variables, outputs |
| `azure-pipelines.yml` | Azure DevOps pipeline running init, validate, plan, and apply |
| `.gitignore` | Excludes local state, `.terraform/`, and plan artifacts from version control |

---

## Running it locally

```bash
cd terraform

terraform init
terraform validate
terraform plan  -var-file=<environment>.tfvars
terraform apply -var-file=<environment>.tfvars
```

Variable files are kept per environment so the same configuration provisions Development,
Stage, and Production without duplicating resource definitions.

---

## Notes on state and secrets

- Local state and `.terraform/` are gitignored; remote state should be configured in the
  backend block before use.
- No credentials are committed. The pipeline authenticates through an Azure DevOps service
  connection rather than static keys in the repository.

---

## Tech stack

Terraform (HCL) · Microsoft Azure · Azure DevOps YAML Pipelines
