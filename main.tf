provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAUMYXXCGSWCQTKO6X"
  secret_key = "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"
}
/*Creation of VPC*/
resource "aws_vpc" "green-vpc" {
  cidr_block = "10.10.0.0/16"
    tags = {Name = "projectGreen-vpc"}
}
