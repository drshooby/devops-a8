# devops-a8

## How to Use  

- Run `python3 setenv.py` and enter your credentials, then run the printed command for your system
- Run the following commands to ensure the project is up-to-date, properly configured, then apply the changes in AWS

```bash
terraform init
terraform plan
terraform apply
```

## Required Variables
- Create a terraform.tfvars if you don't already have one (key = "value" syntax)
- The following variables must be set `public_key, bastion_allowed_cidr`
- If not using `us-east-1` as your AWS region, please set `aws_region, aws_azs`
- If not using the AWS Lab environment, please set `iam_instance_profile`
- Other non-required variables can be seen in `variables.tf` (subnets and naming, defaults should be OK)

## SSH

- Run `ssh-keygen -y -f /path/to/your-key.pem > /path/to/your-key.pub`
- Then copy the key into terraform.tfvars

## Useful Items

- View instances from within the bastion `aws ec2 describe-instances --query "Reservations[].Instances[].[PrivateIpAddress,Tags[?Key=='Name'].Value|[0]]" --output table --region your-region`
- Get your public IP <a href="https://www.whatsmyip.org/">What's My IP?</a>
