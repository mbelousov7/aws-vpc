variable "cidr_block" {
  type        = string
  description = "IPv4 CIDR to assign to the VPC"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "default_security_group_deny_all" {
  type        = bool
  default     = true
  description = <<-EOT
    When `true`, manage the default security group and remove all rules, disabling all ingress and egress.
    When `false`, do not manage the default security group, allowing it to be managed by another component
    EOT
}
