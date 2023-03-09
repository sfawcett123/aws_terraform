# Terraform Provider

You must tell terraform which 'providers' you are going to need, in our case we are going to use the AWS Provider. A full list can be found at [Hashicorp Terraform Registry]( https://registry.terraform.io/browse/providers)

## Provider

The following code should be put in a file named providers.tf, though technically you can call the file anything you like as long as it has a .tf on the end. But, providers.tf is a good convention. 

```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
```

##  Specifications

Some providers require you to configure some intital settings. The [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) requires the region to be set.

```
provider "aws" {
  region = "eu-west-1"
}
```

## Initialization

Once you have configured your providers you will need to initialize terraform, which will download them and get you one your way.

```
terraform init
```
