# devops-a8

## How to Use

1. Run `python3 setenv.py` and enter your credentials, then run the printed command for your system

2. ```bash
terraform init
terraform plan
terraform apply
```

Windows Lab User SSH

- Run `ssh-keygen -y -f C:\path\to\your-key.pem > C:\path\to\your-key.pub` (should be labsuser from AWS lab) 
- Then copy the key into terraform.tfvars (use `variables.tf` as a guide if needed)