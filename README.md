# Build Infrastructure with Terraform on Google Cloud

A portfolio of hands-on Terraform labs provisioning infrastructure on Google Cloud, covering the core workflow, dependency management, and reusable modules.

## Labs

| Lab | Focus | Notes |
|---|---|---|
| [`terraform-fundamentals/`](./terraform-fundamentals) | Core Terraform workflow: `init`, `plan`, `apply`; provisioning a Compute Engine instance | [README](./terraform-fundamentals/README.MD) |
| [`infrastructure-as-code-with-terraform/`](./infrastructure-as-code-with-terraform) | Resource dependencies: implicit dependency via attribute references vs. explicit `depends_on` | [README](./infrastructure-as-code-with-terraform/README.MD) |
| [`interact-with-terraform-modules/`](./interact-with-terraform-modules) | Building and consuming a reusable local module (`gcs-static-website-bucket`) for a GCS static website bucket | — |

## Stack

- [Terraform](https://www.terraform.io/)
- [Google Cloud Platform](https://cloud.google.com/) (Compute Engine, Cloud Storage)

## What this demonstrates

- Reading and writing declarative infrastructure configuration (`.tf` files: resources, variables, outputs)
- Understanding Terraform's plan/apply lifecycle and resource dependency graph
- Structuring configuration into reusable local modules with well-defined inputs/outputs
