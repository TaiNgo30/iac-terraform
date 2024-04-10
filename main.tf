provider "aws" {
  region = var.region
}

module "networking" {
  source              = "./modules/networking"
  region              = var.region
  availability_zone_1 = var.availability_zone_1
  availability_zone_2 = var.availability_zone_2
  cidr_block          = var.cidr_block
  public_subnet_ips   = var.public_subnet_ips
  private_subnet_ips  = var.private_subnet_ips
}

module "security" {
  source = "./modules/security"
  region = var.region
  vpc_id = module.networking.vpc_id
  public_ingress_rules = var.public_ingress_rules
  private_ingress_rules = var.private_ingress_rules
  egress_rules = var.egress_rules
}

resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2_key"
  public_key = file(var.keypair_path)
}



module "compute" {
  source                 = "./modules/compute"
  region                 = var.region
  image_id               = var.amis[var.region]
  key_name               = aws_key_pair.ec2_key.key_name
  instance_type          = var.instance_type
  ec2_security_group_ids = [module.security.public_security_group_id]
  subnet_id              = module.networking.public_subnet_ids[0]
  user_data              = file("./user-data-script.sh")
}
