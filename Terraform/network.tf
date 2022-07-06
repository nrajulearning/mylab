# Creating VPC network under Mumbai region

resource "aws_vpc" "mylab-vpc" {
    cidr_block = "172.20.0.0/16"
    tags = {
      "Name" = "MyVPC-test"
    }  
}

# Create Public subnet

resource "aws_subnet" "mylab-subnet1-public" {
    vpc_id = aws_vpc.mylab-vpc.id
    cidr_block = "172.20.10.0/24"
    tags = {
      "Name" = "Subnet1-public"
    }
}

# Create Private Subnet
resource "aws_subnet" "mylab-subnet2-private" {
    vpc_id = aws_vpc.mylab-vpc.id
    cidr_block = "172.20.30.0/24"
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