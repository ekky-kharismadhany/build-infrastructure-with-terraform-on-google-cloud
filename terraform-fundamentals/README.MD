# Terraform Fundamentals

## What is Terraform?

Terraform is an Infrastructure of Code (IaC) solution where we can declaratively construct infrastructure. 

## Basic Command

We have three main command on to work with terraform:

1. `terraform init`: Initiate terraform project, download cloud registry, etc

2. `terraform plan`: Terraform perform refresh on current condition on the cloud and perform calculation on what action shall terraform takes to achieve user goals. It also builds user confidence as the user can (and should) verify what action terraform shall takes. 

3. `terraform apply`: Terraform will perform series of action to achieve state the user declares on terraform code.

## Result and What I learnt

Terraform has `Resource actions` where terraform informs user what course of action it will take. In this lab, I know that the terraform will *create* something from this information:

```bash
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # google_compute_instance.default will be created
  + resource "google_compute_instance" "default" {
      + can_ip_forward       = false
      + cpu_platform         = (known after apply)
      + creation_timestamp   = (known after apply)
      + current_status       = (known after apply)
      + deletion_policy      = "DELETE"
      + deletion_protection  = false
      + effective_labels     = {
          + "goog-terraform-provisioned" = "true"
        }
    ....
```

Notice `+` notation that indicates creation of a resources.