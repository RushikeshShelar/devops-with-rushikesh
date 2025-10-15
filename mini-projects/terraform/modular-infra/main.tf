provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source    = "./modules/vpc"
  vpc_cidr  = "10.0.0.0/16"
}

module "sg" {
  source  = "./modules/sg"
  vpc_id  = module.vpc.vpc_id
}

module "ec2" {
  source        = "./modules/ec2"
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro"
  key_name      = "Rushi-Laptop-EC2"
  sg_id         = module.sg.sg_id
  # Replace with actual subnet
}

# Similarly add module "alb" and module "rds"
