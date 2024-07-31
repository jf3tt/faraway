resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name                               = "${var.name}-vpc"
    "kubernetes.io/cluster/kubernetes" = "owned"
  }
}

# Subnets
data "aws_availability_zones" "available" {}

resource "aws_subnet" "private" {
  count                   = length(var.availability_zones)
  map_public_ip_on_launch = true
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  cidr_block              = cidrsubnet(var.cidr_block, 8, count.index)
  vpc_id                  = aws_vpc.main.id

  tags = {
    Name = "${var.name}_subnet_private_${count.index + 1}"
  }
}

resource "aws_subnet" "public" {
  count                   = length(var.availability_zones)
  map_public_ip_on_launch = true
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  cidr_block              = cidrsubnet(var.cidr_block, 8, count.index + 20)
  vpc_id                  = aws_vpc.main.id

  tags = {
    "Name"                                      = "${var.name}_subnet_public_${count.index + 1}"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Main"
  }
}

# Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    gateway_id = aws_internet_gateway.main.id
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "Private"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "Public"
  }
}

# Route Table Association
resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

