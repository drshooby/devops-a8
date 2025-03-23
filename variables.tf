variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Default region."
}

variable "vpc_name" {
  type        = string
  default     = "my-vpc"
  description = "VPC name."
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "VPC CIDR block."
}

variable "aws_azs" {
  description = "List of az in the specified region"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "public_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "Public subnet CIDR blocks."
}

variable "private_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  description = "Private subnet CIDR blocks."
}

variable "public_key" {
  type        = string
  default     = "ssh-rsa xxxxxxxxx"
  description = "Public key to be used for bastion host."
}

variable "bastion_prefix" {
  type       = string
  default    = "bastion-a8"
  description = "Prefix for bastion host."
}

variable "resource_tags" {
  type       = map(string)
  default    = {
    Terraform   = "true"
    Environment = "local"
  }
  description = "A map of tags to add to all resources."
}

variable "ssh_key_name" {
  type        = string
  default     = "bastion-key"
  description = "SSH key name."
}

variable "bastion_allowed_cidr" {
  type        = list(string)
  default     = ["xxx.xxx.xxx.xxx/32"]
  description = "CIDR block to allow SSH access to bastion host."
}

variable "iam_instance_profile" {
  type        = string
  default     = "LabInstanceProfile"
  description = "IAM instance profile name."
}