# Infrastructure as Code with Terraform

## What I learnt

### Infra Dependency

We can reference resources properties to be used on others. For example, we can use refer `google_compute_network.vpc_network.self_link` as VPC name, as long as we already declare `vpc_network` VPC beforehand. This configuration also make `implicit dependency`. We can also declare an explicit dependency with `depends_on` attribute
