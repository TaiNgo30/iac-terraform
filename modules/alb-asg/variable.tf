variable "environment" {
  description = "The deployment environment (e.g., prod, dev, staging)"
  default     = "dev"
}

variable "internal" {
  type    = bool
  default = false
}
variable "version-01" {
  type    = string
  default = "$Latest"
}
variable "enable_deletion_protection" {
  type    = bool
  default = false
}


variable "enable_health_check" {
  description = "Enable health check for the target group"
  type        = bool
  default     = true
}

variable "load_balancer_type" {
  type    = string
  default = "application"
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
