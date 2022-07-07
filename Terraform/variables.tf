variable "region_name" {
  type    = list(string)
  default = ["ap-south-1", "ap-east-1"]
}

variable "cidr_block" {
  type    = list(string)
  default = ["172.20.0.0/16", "172.20.10.0/24", "172.20.30.0/24", "0.0.0.0/0"]

}

variable "availability_zone" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]

}

variable "ports" {
  type    = list(number)
  default = [22, 80, 8081, 443, 8080]

}
variable "ami" {
  type    = string
  default = "ami-006d3995d3a6b963b"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"

}