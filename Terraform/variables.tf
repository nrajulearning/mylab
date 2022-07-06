variable "region_name" {
  type    = list(string)
  default = ["ap-south-1", "us-west-1"]
}

variable "cidr_block" {
  type    = list(string)
  default = ["172.20.0.0/16", "172.20.10.0/24", "172.20.30.0/24", "0.0.0.0/0"]

}

variable "ports" {
  type    = list(number)
  default = [22, 80, 8081, 443, 8080]

}