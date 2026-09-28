# Manage Terraform State

Terraform needs a memory to maintain information about what infrastructure its provisioned. The memory is maintainer of `*.tfstate` file and can be stored on multiple locations, or in the context of Terraform, we refer this location as `backend`.

## What I learnt

1. We can refresh the state of `tfstate` by running `terraform refresh`. It does not make any changes on the infrastructure, the command just refresh the `tfstate` file.
2. I can imagine that we can put `tfstate` on a remote location (not to confuse with actual `remote` backend option) such as Google Cloud Storage. This way, we can decouple `tfstate` and `tf` file. This makes team collaboration possible because the state of infrastructure is stored remotely, not on individual machines.