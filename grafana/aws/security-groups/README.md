# AWS Security Groups for Grafana SaaS inbound traffic
This root module is responsible for populating security groups on a target
VPC. These Security Groups are to be attached to instances running Keep nodes,
so that Grafana Cloud can access it and read the logs.

## TL;DR Getting started
Above is already short.

1. Using the machine you intend to apply the config with, log in to AWS CLI `awscli` to obtain and store your credentials.
1. Confirm the variables for your specific scenario:
    - Copy `terraform.tfvars.json.SAMPLE` and remove ".SAMPLE" from the extension
    - Fill in your default region and VPC id.
1. Run `terraform init`
1. Run `terraform plan` or `source terraform-plan.sh`. The latter uses the variables file you populated on step 2.
1. When feeling confident, run `source terraform-apply.sh`
1. Enjoy your new security groups! Now go and add them to your instance's network interface.

### to-do subtitle L3
