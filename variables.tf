######################################## names, labels, tags ########################################
variable "labels" {
  type = object({
    prefix    = string
    stack     = string
    component = string
    env       = string
  })
  description = "Minimum required map of labels(tags) for creating aws resources"
}

variable "tags" {
  type        = map(string)
  description = "Additional tags"
  default     = {}
}

variable "vpc_name" {
  type        = string
  description = <<-EOT
      optionally define a custom value for the vpc.
      By default, it is defined as a construction from var.labels
    EOT
  default     = "default"
}

variable "igw_enable" {
  type        = bool
  description = <<-EOT
      optionally define if it not necessary to deploy internet gateway for vpc
    EOT
  default     = true
}

variable "igw_name" {
  type        = string
  description = <<-EOT
      optionally define a custom value for the internet gateway name.
      By default, it is defined as a construction from var.labels
    EOT
  default     = "default"
}

variable "dsg_name" {
  type        = string
  description = <<-EOT
      optionally define a custom value for the default security group name.
      By default, it is defined as a construction from var.labels
    EOT
  default     = "default"
}

variable "cidr_block" {
  type        = string
  description = "IPv4 CIDR to assign to the VPC"
}

variable "default_security_group_deny_all" {
  type        = bool
  default     = true
  description = <<-EOT
    When `true`, manage the default security group and remove all rules, disabling all ingress and egress.
    When `false`, do not manage the default security group, allowing it to be managed by another component
    EOT
}
