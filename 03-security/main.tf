resource "aws_security_group" "this" {
  name_prefix = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id

  tags = merge(
    var.common_tags,
    {
      Name = var.security_group_name
    }
  )
}

# Ingress rules
resource "aws_security_group_rule" "ingress" {
  for_each = { for idx, rule in var.ingress_rules : idx => rule }

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_groups   = each.value.source_security_group_ids
  description       = each.value.description
  security_group_id = aws_security_group.this.id
}

# Egress rules
resource "aws_security_group_rule" "egress" {
  for_each = { for idx, rule in var.egress_rules : idx => rule }

  type              = "egress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_groups   = each.value.destination_security_group_ids
  description       = each.value.description
  security_group_id = aws_security_group.this.id
}
