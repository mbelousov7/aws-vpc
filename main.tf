resource "aws_vpc" "default" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  tags = merge(
    var.tags,
    { Name = "${var.tags.prefix}-${var.tags.env}-${var.tags.component}-vpc" }
  )
}

# If `aws_default_security_group` is not defined, it will be created implicitly with access `0.0.0.0/0`
resource "aws_default_security_group" "default" {
  count  = var.default_security_group_deny_all ? 1 : 0
  vpc_id = aws_vpc.default.id
  tags = merge(
    var.tags,
    { Name = "${var.tags.prefix}-${var.tags.env}-${var.tags.component}-dsgr" }
  )
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id
  tags = merge(
    var.tags,
    { Name = "${var.tags.prefix}-${var.tags.env}-${var.tags.component}-digw" }
  )
}