# devops-a8

## How to Use  

- Run `python3 setenv.py` and enter your credentials, then run the printed command for your system
- Run the following commands **after** first checking out the required variables section to make sure everything runs smoothly

```bash
packer init .
packer validate .
packer build .
```

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
- Please take a look at the variables in `ami.pkr.hcl` to make sure they are correct like the path to your public key, for example.
- Update the `packer_ami_id` variable after running the packer code and seeing your output ami
- Other non-required variables can be seen in `variables.tf` (subnets and naming, defaults should be OK)

```bash
Example terraform.tfvars file:
public_key = "~/.ssh/your-key-file.pub"
bastion_allowed_cidr = [ "xxx.xxx.xxx.xxx/32" ]
```

## SSH Setup
- Run `ssh-keygen -y -f path/to/your-key.pem > path/to/your-key.pub`
- Run `chmod 600` if you run into permission problems
- Then copy the pub key location into terraform.tfvars

## SSH Usage
- Add your key to SSH agent `ssh-add path/to/your-key.pem`
- SSH into the bastion with forwarding `ssh -A ec2-user@[BASTION-PUBLIC-IP]`
- From the bastion, connect to one of the 6 machines `ssh ec2-user@[PRIVATE-INSTANCE-IP]` (check out useful items for the command to list the instances and their IPs)

## Useful Items

- View instances and their IPs from within the bastion `aws ec2 describe-instances --query "Reservations[].Instances[].[PrivateIpAddress,Tags[?Key=='Name'].Value|[0]]" --output table --region your-region`
- Get your public IP <a href="https://www.whatsmyip.org/">What's My IP?</a>
