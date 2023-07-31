terraform {
  required_version = ">= 0.12"

  backend "s3" {
    bucket = "terraform-state-practice1"
    key    = "terraform.state"
    region = "ap-south-1"
    encrypt= false
  }
  
}

provider "aws" {
    region = "ap-south-1"
}
resource "aws_vpc" "terraform-vpc" {
    cidr_block = var.cidr_block
    tags = {
        Name = "terraform-vpc"
    }
}

module "myapp-subnet" {
  source = "./modules/subnet"
  vpc_id = aws_vpc.terraform-vpc.id
  subnet_cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone
  env_prefix = var.env_prefix
}

module "myapp-igw" {
  source = "./modules/igw"
  env_prefix = var.env_prefix
  vpc_id = aws_vpc.terraform-vpc.id
}

module "myapp-rtb" {
  source =  "./modules/routes-table"
  env_prefix = var.env_prefix
  igw_id = module.myapp-igw.igw_id
  vpc_id = aws_vpc.terraform-vpc.id
}


# id=vpc-078e421279fccd87

output "terraform_vpc_id"  {
  value = aws_vpc.terraform-vpc.id
}