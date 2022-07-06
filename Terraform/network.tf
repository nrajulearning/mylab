# Creating VPC network under Mumbai region

resource "aws_vpc" "mylab-vpc" {
  cidr_block = var.cidr_block[0]
  tags = {
    "Name" = "MyVPC-test"
  }
}

# Create Public subnet

resource "aws_subnet" "mylab-subnet1-public" {
  vpc_id     = aws_vpc.mylab-vpc.id
  cidr_block = var.cidr_block[1]
  tags = {
    "Name" = "Subnet1-public"
  }
}

# Create Private Subnet
resource "aws_subnet" "mylab-subnet2-private" {
  vpc_id     = aws_vpc.mylab-vpc.id
  cidr_block = var.cidr_block[2]
  tags = {
    "Name" = "Subnet2-private"
  }
}

# Enable Internet Gateway for VPC Network

resource "aws_internet_gateway" "mylab-IntGW" {
  vpc_id = aws_vpc.mylab-vpc.id
  tags = {
    "Name" = "MyVPC-IGW"
  }
}

# Create security groups to enable network traffic 

resource "aws_security_group" "mylab-security-group" {
  name        = "allow traffid"
  description = "security group to allow TCP port 22 traffic"
  vpc_id      = aws_vpc.mylab-vpc.id

  dynamic "ingress" {
    iterator = port
    for_each = var.ports
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_route_table" "mylab-route-table" {
  vpc_id = aws_vpc.mylab-vpc.id

  route {
    cidr_block = var.cidr_block[3]
    gateway_id = aws_internet_gateway.mylab-IntGW.id
  }

  tags = {
    "Name" = "mylab_route_table"
  }

  depends_on = [
    aws_vpc.mylab-vpc
  ]
}

resource "aws_route_table_association" "mylab-association" {
  subnet_id      = aws_subnet.mylab-subnet1-public.id
  route_table_id = aws_route_table.mylab-route-table.id

  depends_on = [
    aws_route_table.mylab-route-table,
    aws_subnet.mylab-subnet1-public
  ]

}