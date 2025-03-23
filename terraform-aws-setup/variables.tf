# AWS Region
variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

# Availability Zones (List)
variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

# Enable or Disable SSH Access (Boolean)
variable "enable_ssh" {
  description = "Enable SSH access to EC2 instance"
  type        = bool
  default     = true
}

# VPC CIDR Block
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Subnet CIDR Block
variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# Key Pair Name (for SSH access)
variable "key_pair_name" {
  description = "AWS Key Pair Name for EC2 SSH Access"
  type        = string
  default     = "new-key-pair"
}
