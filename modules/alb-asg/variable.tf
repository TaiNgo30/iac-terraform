variable "environment" {
  description = "The deployment environment (e.g., prod, dev, staging)"
}

variable "public_security_group_id" {
  description = "The ID of the public security group from the security module"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs from the networking module"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet IDs from the networking module"
}

variable "vpc_id" {
  description = "The VPC ID from the networking module"
}

variable "launch_template_id" {
  description = "ID of the EC2 launch template created in the compute module"
}

variable "min_size" {
  description = "Minimum size of the ASG"
}

variable "max_size" {
  description = "Maximum size of the ASG"
}

variable "desired_capacity" {
  description = "Desired number of instances in the ASG"
}
