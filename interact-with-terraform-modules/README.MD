# Interract With Terraform Modules

Building and consuming a reusable local Terraform module (`gcs-static-website-bucket`) that provisions a Google Cloud Storage bucket configured for static website hosting.

## What I learnt

1. Terraform supports concepts called `modules`. This concept is similiar to library on other scripting / programming language.
2. Terraform's syntax support simple dynamic creation of a resource with `for_each` and `content`.
3. We can use `output` to export terraform output value, so it can be consumed by others modules / procesess
4. We can use `lookup` to find a value in map that we can't sure will be exist at evaluation.
