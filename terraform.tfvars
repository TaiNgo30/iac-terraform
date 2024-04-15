region              = "ap-southeast-1"
availability_zone_1 = "ap-southeast-1a"
availability_zone_2 = "ap-southeast-1b"
cidr_block          = "10.0.0.0/16"
public_subnet_ips   = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_ips  = ["10.0.10.0/24", "10.0.20.0/24"]
keypair_path        = "./keypair/taind-key.pub"
instance_type       = "t3.micro"
public_ingress_rules = [
  {
    from_port   = 443,
    to_port     = 443,
    protocol    = "tcp",
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 80,
    to_port     = 80,
    protocol    = "tcp",
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 22,
    to_port     = 22,
    protocol    = "tcp",
    cidr_blocks = ["0.0.0.0/0"]
  }
]

private_ingress_rules = [
  {
    from_port = 80,
    to_port   = 80,
    protocol  = "tcp"
  },
  {
    from_port = 3306,
    to_port   = 3306,
    protocol  = "tcp"
  }
]

egress_rules = [{
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}]



desired_capacity   = 2
environment        = "prod"
max_size           = 4
min_size           = 2
