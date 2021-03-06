variable region { default = "eu-west-2" }

resource aws_vpc default {
  cidr_block           = "172.31.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false

  tags = {
    Name = "default"
  }
}

resource aws_internet_gateway default {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "default"
  }
}

resource aws_route_table default {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "default"
  }
}

resource aws_route default {
  route_table_id         = aws_route_table.default.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}

resource aws_main_route_table_association default {
  vpc_id         = aws_vpc.default.id
  route_table_id = aws_route_table.default.id
}

resource aws_security_group default {
  vpc_id      = aws_vpc.default.id
  name        = "default-1"
  description = "default VPC security group"

  tags = {
    Name = "default"
  }
}

resource aws_security_group_rule default {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  security_group_id = aws_security_group.default.id
  protocol          = -1
  self              = "true"
}

resource aws_security_group_rule default-1 {
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  security_group_id = aws_security_group.default.id
  protocol          = -1
}

resource aws_subnet default0 {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = "172.31.0.0/20"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.region}a"

  tags = {
    Name = "default"
  }
}

resource aws_subnet default16 {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = "172.31.16.0/20"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.region}b"

  tags = {
    Name = "default"
  }
}

resource aws_subnet default32 {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = "172.31.32.0/20"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.region}c"

  tags = {
    Name = "default"
  }
}