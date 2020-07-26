# Terraflops Terraform Module

**Warning:** This repository is not fit for human consumption, it is developed for internal purposes
only, if you get any benefit out of it- feel free to use it, however no support is offered.
 
### AWS Secrets Manager Secrets

This module can be used to create secrets in AWS Secrets Manager.

## Example Usage

```hcl-terraform
module "serverless" {
  source = "git::https://github.com/TerraFlops/aws-secrets-manager-secrets.git"
  base_path = "/MyApplication/Secrets/"
  secrets = [
    {
      path = "MyPassword"
      value = "password1"
      description = "My super secret password"
    }
  ]
}
```