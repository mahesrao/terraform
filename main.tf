/*Provider*/
provider "aws" {
  region     = "us-east-1"
}
/*Creation of VPC*/
resource "aws_vpc" "green-vpc" {
  cidr_block = "10.10.0.0/16"
    tags = {Name = "projectGreen-vpc"}
}

/*Creation of igw*/
resource "aws_internet_gateway" "green-igw" {
    vpc_id = aws_vpc.green-vpc.id
	tags = {Name = "projectGreen-igw"}
}

/*Creation of subnets*/
resource "aws_subnet" "green-public-subnet-1a" {
  vpc_id     = aws_vpc.green-vpc.id
  cidr_block = "10.10.1.0/24"
  availability_zone = "us-east-1a"
  tags = {Name = "projectGreen-public-subnet-1a"}
}
resource "aws_subnet" "green-public-subnet-1b" {
  vpc_id     = aws_vpc.green-vpc.id
  cidr_block = "10.10.2.0/24"
  availability_zone = "us-east-1b"
  tags = {Name = "projectGreen-public-subnet-1b"}
}
resource "aws_subnet" "green-private-subnet-1c" {
  vpc_id     = aws_vpc.green-vpc.id
  cidr_block = "10.10.3.0/24"
  availability_zone = "us-east-1c"
  tags = {Name = "projectGreen-private-subnet-1c"}
}
resource "aws_subnet" "green-private-subnet-1d" {
  vpc_id     = aws_vpc.green-vpc.id
  cidr_block = "10.10.4.0/24"
  availability_zone = "us-east-1d"
  tags = {Name = "projectGreen-private-subnet-1d"}
}
/*Creation of route tables*/
resource "aws_route_table" "green-private-rt" {
  vpc_id = aws_vpc.green-vpc.id
}
route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = "aws_nat_gateway" "green-nat-gateway" 
    }

resource "aws_route_table" "green-public-rt" {
  vpc_id = aws_vpc.green-vpc.id
}
route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = "aws_nat_gateway" "green-nat-gateway" 
    }
