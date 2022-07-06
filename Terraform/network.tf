# Creating VPC network under Mumbai region

resource "aws_vpc" "mylab-vpc" {
    cidr_block = "172.20.0.0/16"
    tags = {
      "Name" = "MyVPC-test"
    }  
}
