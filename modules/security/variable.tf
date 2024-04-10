variable "region" {
  type    = string
  default = "ap-southeast-1"
}
variable "vpc_id" {
  type        = string
  description = "The VPC ID"
  nullable    = false
}

variable "public_ingress_rules" {
  description = "List of ingress rules for the public security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "private_ingress_rules" {
  description = "List of ingress rules for the private security group that are allowed from the public security group"
  type = list(object({
    from_port = number
    to_port   = number
    protocol  = string
  }))
}


variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
