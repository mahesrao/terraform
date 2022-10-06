/*Provider*/
provider "aws" {
  region     = "us-east-1"
}
/*Creation of VPC*/
resource "aws_vpc" "green-vpc" {
  cidr_block = "10.10.0.0/16"
    tags = {Name = "projectGreen-vpc"}
}
