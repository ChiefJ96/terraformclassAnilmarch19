# Define AWS provider
provider "aws" {
  region = var.aws_region
}

# Create a VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "MyVPC"
  }
}

# Create a subnet inside the VPC
resource "aws_subnet" "main_subnet" {
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zones[0] # first AZ

  tags = {
    Name = "MySubnet"
  }
}

# Create a security group
resource "aws_security_group" "main_sg" {
  vpc_id = aws_vpc.main_vpc.id

  # Allow SSH only if enabled
  dynamic "ingress" {
    for_each = var.enable_ssh ? [1] : []
    content {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"] 
    }
  }

  tags = {
    Name = "MySecurityGroup"
  }
}

# Create an EC2 instance
resource "aws_instance" "main_instance" {
  ami                    = "ami-08b5b3a93ed654d19"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.main_subnet.id
  vpc_security_group_ids = [aws_security_group.main_sg.id]  # corrected after Anils explanation
  key_name               = var.key_pair_name

  tags = {
    Name = "MyUbuntuServer"
  }
}
