variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}

variable "security_group_description" {
  description = "Description of the security group"
  type        = string
  default     = "Managed by Terraform"
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
  default     = null
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from_port                 = number
    to_port                   = number
    protocol                  = string
    cidr_blocks               = list(string)
    source_security_group_ids = list(string)
    description               = string
  }))
  default = []
}

variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    from_port                      = number
    to_port                        = number
    protocol                       = string
    cidr_blocks                    = list(string)
    destination_security_group_ids = list(string)
    description                    = string
  }))
  default = [
    {
      from_port                      = 0
      to_port                        = 0
      protocol                       = "-1"
      cidr_blocks                    = ["0.0.0.0/0"]
      destination_security_group_ids = []
      description                    = "Allow all outbound traffic"
    }
  ]
}

variable "common_tags" {
  description = "Common tags to apply to resources"
  type        = map(string)
  default     = {}
}
