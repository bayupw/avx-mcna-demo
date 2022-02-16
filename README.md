# Aviatrix MCNA

Terraform codes to setup Aviatrix Multi-Cloud Networking Architecture using Aviatrix modules across AWS, Azure and GCP.

![Aviatrix MCNA CoPilot Topology](images/avx-mcna-demo-copilot.png "Aviatrix CoPilot Topology")

## Environment Variables

To run this project, you will need to set the following environment variables

`AVIATRIX_CONTROLLER_IP`

`AVIATRIX_USERNAME`

`AVIATRIX_PASSWORD`

`TF_VAR_aws_account`

`TF_VAR_azure_account`

`TF_VAR_gcp_account`

## Run Locally

Clone the project

```bash
git clone https://github.com/bayupw/avx-mcna-demo
```

Go to the project directory

```bash
cd avx-mcna-demo
```

Set environment variables

```bash
export AVIATRIX_CONTROLLER_IP="aviatrixcontroller.aviatrix.lab"
export AVIATRIX_USERNAME="admin"
export AVIATRIX_PASSWORD="Aviatrix123!"
export TF_VAR_aws_account="AWS-Aviatrix-Account"
export TF_VAR_azure_account="Azure-Aviatrix-Account"
export TF_VAR_gcp_account="GCP-Aviatrix-Account"
```

Terraform workflow

```bash
terraform init
terraform plan
terraform apply -auto-approve
```