# Build Infrastructure with Terraform on Google Cloud

My hands-on notes from working through Terraform labs on Google Cloud. Each lab builds on the previous one: from running the first `terraform apply`, to wiring resources together, to packaging them as modules, to understanding where Terraform keeps track of what it has built.

## Learning Path

| # | Lab | Focus | Notes |
|---|---|---|---|
| 1 | [`terraform-fundamentals/`](./terraform-fundamentals) | Core workflow (`init` → `plan` → `apply`) by provisioning a Compute Engine instance | [README](./terraform-fundamentals/README.MD) |
| 2 | [`infrastructure-as-code-with-terraform/`](./infrastructure-as-code-with-terraform) | Resource dependencies: implicit (attribute references) vs. explicit (`depends_on`) | [README](./infrastructure-as-code-with-terraform/README.MD) |
| 3 | [`interact-with-terraform-modules/`](./interact-with-terraform-modules) | Building and consuming a reusable local module (`gcs-static-website-bucket`) | [README](./interact-with-terraform-modules/README.MD) |
| 4 | [`manage-terraform-state/`](./manage-terraform-state) | Terraform state and moving it to a remote `gcs` backend | [README](./manage-terraform-state/README.MD) |

## Key Takeaways

### 1. Terraform Fundamentals

- Terraform is declarative. I describe the end state I want, and Terraform works out the steps to get there.
- The workflow has three steps:
  - `terraform init` sets up the working directory and downloads providers.
  - `terraform plan` compares my config with what exists and shows what it would do.
  - `terraform apply` makes those changes.
- The plan output is the safety check. Symbols like `+` (create) tell me what will happen before anything changes, so I should always read the plan before applying.

### 2. Infrastructure as Code: Dependencies

- Resources can use each other's attributes. For example, a VM can use `google_compute_network.vpc_network.self_link`.
- A reference like that creates an **implicit dependency**: Terraform sees it and creates the network before the VM.
- When there is no reference but order still matters, `depends_on` sets an **explicit dependency**.
- Terraform uses these dependencies to build a graph, which decides what gets created first and what can be created in parallel.

### 3. Modules

- A module is like a library in a programming language. It groups resources behind a set of inputs (`variables.tf`) and outputs (`outputs.tf`).
- `output` values let other modules or processes use results such as bucket names or URLs.
- `dynamic` blocks with `for_each` / `content` generate repeated nested blocks from data.
- `lookup()` reads a map value safely when the key might not be there.

### 4. Terraform State

- State (`*.tfstate`) is Terraform's memory: it links the resources in my config to the real resources in the cloud.
- The **backend** is where the state is stored. By default it is a local file. With the `gcs` backend, it lives in a Cloud Storage bucket instead:

  ```hcl
  terraform {
    backend "gcs" {
      bucket = "<bucket-name>"
      prefix = "terraform/state"
    }
  }
  ```

- Remote state separates the state from any one person's laptop, so a team can work from the same source of truth.
- `terraform refresh` updates the state to match the real infrastructure without changing the infrastructure itself.

## How the Concepts Connect

```
Config (.tf)  ──plan──▶  Diff  ──apply──▶  Cloud resources
     │                     ▲                     │
     │                     └──── State ◀─────────┘
     │                    (local or remote backend)
     └── organised via modules, ordered via the dependency graph
```

## Stack

- [Terraform](https://www.terraform.io/)
- [Google Cloud Platform](https://cloud.google.com/): Compute Engine, VPC, Cloud Storage

## What This Demonstrates

- Writing declarative infrastructure config with resources, variables, outputs, and providers
- Understanding the plan/apply lifecycle and how Terraform orders resources
- Organising config into reusable modules with clear inputs and outputs
- Managing state and using a remote backend so a team can collaborate

## Next Things to Explore

- `terraform apply -refresh-only`, the recommended replacement for `terraform refresh`
- State locking, and what happens when two people apply at the same time
- `terraform state` subcommands (`list`, `show`, `mv`, `rm`) and `terraform import`
- Workspaces or separate backends for multiple environments (dev/staging/prod)
