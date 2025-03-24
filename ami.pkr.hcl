packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

# Update these as needed, current configuration is for lab users
variable "ami_name" {
  default = "custom-amazonlinux-ami-{{timestamp}}"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "ssh_key_name" {
  default = "vockey"
}

variable "ssh_pkey_file" {
  default = "~/.ssh/labsuser.pem"
}

# Run echo $HOME/.ssh/labsuser.pub to get the public key path
variable "ssh_public_key_path" {
  default = "/Users/yourname/.ssh/labsuser.pub"
}

source "amazon-ebs" "amazonlinux" {
  ami_name            = var.ami_name
  instance_type       = var.instance_type
  region              = var.aws_region

  ssh_keypair_name    = var.ssh_key_name
  ssh_private_key_file = var.ssh_pkey_file

  source_ami_filter {
    filters = {
      name                = "amzn2-ami-hvm-*-x86_64-gp2"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    owners            = ["137112412989"]
    most_recent       = true
  }
  ssh_username        = "ec2-user"
}

build {
  sources = ["source.amazon-ebs.amazonlinux"]

  provisioner "shell" {
    inline = [
      "sudo amazon-linux-extras install docker -y",
      "sudo systemctl enable docker",
      "sudo systemctl start docker",
      "sudo usermod -a -G docker ec2-user"
    ]
  }
  
  provisioner "file" {
    source      = var.ssh_public_key_path
    destination = "/tmp/labsuser.pub"
  }
  
  provisioner "shell" {
    inline = [
      "mkdir -p ~/.ssh",
      "chmod 700 ~/.ssh",
      "cat /tmp/labsuser.pub >> ~/.ssh/authorized_keys",
      "chmod 600 ~/.ssh/authorized_keys",
      "rm /tmp/labsuser.pub"
    ]
  }

  provisioner "shell" {
    inline = [
      "echo 'Verifying SSH key setup:'",
      "cat ~/.ssh/authorized_keys",
      "ls -la ~/.ssh",
      "grep -c 'ssh-rsa' ~/.ssh/authorized_keys || echo 'No SSH keys found!'"
    ]
  }
}