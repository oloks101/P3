# VPC Resources
#  * VPC
#  * Subnets
#  * Internet Gateway
#  * Route Table

resource "aws_vpc" "seera" {
  cidr_block = "192.168.0.0/24"

  tags = map(
    "Name", "mqbr-eks-node",
    "kubernetes.io/cluster/${var.cluster-name}", "shared",
  )
}

resource "aws_subnet" "seera" {
  count = 2

  availability_zone = data.aws_availability_zones.available.names[count.index]
  cidr_block        = "192.168.${count.index}.0/25"
  vpc_id            = aws_vpc.seera.id
  map_public_ip_on_launch = true

  tags = map(
    "Name", "mqbr-eks-node",
    "kubernetes.io/cluster/${var.cluster-name}", "shared",
  )
}

resource "aws_internet_gateway" "seera" {
  vpc_id = aws_vpc.seera.id

  tags = {
    Name = "terraform-eks-demo"
  }
}

resource "aws_route_table" "seera" {
  vpc_id = aws_vpc.seera.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.seera.id
  }
}

resource "aws_route_table_association" "demo" {
  count = 2

  subnet_id      = aws_subnet.seera.*.id[count.index]
  route_table_id = aws_route_table.seera.id
}