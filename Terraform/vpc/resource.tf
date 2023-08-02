#VPC
resource "aws_vpc" "project02-vpc" {
  cidr_block       = "10.2.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "project02-vpc"
  }
}

#SUBNET
resource "aws_subnet" "project02-subnet-public1" {
  vpc_id            = aws_vpc.project02-vpc.id
  cidr_block        = "10.2.101.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "project02-subnet-public1-ap-northeast-2a"
  }
}

resource "aws_subnet" "project02-subnet-public2" {
  vpc_id            = aws_vpc.project02-vpc.id
  cidr_block        = "10.2.103.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "project02-subnet-public2-ap-northeast-2c"
  }
}

resource "aws_subnet" "project02-subnet-private1" {
  vpc_id            = aws_vpc.project02-vpc.id
  cidr_block        = "10.2.1.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "project02-subnet-private1-ap-northeast-2a"
  }
}

resource "aws_subnet" "project02-subnet-private2" {
  vpc_id            = aws_vpc.project02-vpc.id
  cidr_block        = "10.2.3.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "project02-subnet-private2-ap-northeast-2c"
  }
}

#IGW
resource "aws_internet_gateway" "project02-igw" {
  vpc_id = aws_vpc.project02-vpc.id

  tags = {
    Name = "project02-igw"
  }
}

#EIP
resource "aws_eip" "project02-eip" {
  domain     = "vpc"
  depends_on = ["aws_internet_gateway.project02-igw"]

  lifecycle {
    create_before_destroy = true
  }
}

#NAT
resource "aws_nat_gateway" "project02-nat" {
  allocation_id = aws_eip.project02-eip.id
  subnet_id     = aws_subnet.project02-subnet-public1.id

  tags = {
    Name = "project02-nat-public1-ap-northeast-2a"
  }
}

#Routing Table
resource "aws_route_table" "project02-rt-public" {
  vpc_id = aws_vpc.project02-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project02-igw.id
  }

  tags = {
    Name = "project02-rt-public"
  }
}

resource "aws_route_table" "project02-rt-private1" {
  vpc_id = aws_vpc.project02-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.project02-nat.id
  }

  tags = {
    Name = "project02-rt-private1"
  }
}

resource "aws_route_table" "project02-rt-private2" {
  vpc_id = aws_vpc.project02-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.project02-nat.id
  }

  tags = {
    Name = "project02-rt-private2"
  }
}

resource "aws_route_table_association" "project02-rt-public1" {
  subnet_id      = aws_subnet.project02-subnet-public1.id
  route_table_id = aws_route_table.project02-rt-public.id
}

resource "aws_route_table_association" "project02-rt-public2" {
  subnet_id      = aws_subnet.project02-subnet-public2.id
  route_table_id = aws_route_table.project02-rt-public.id
}

resource "aws_route_table_association" "project02-rt-private1" {
  subnet_id      = aws_subnet.project02-subnet-private1.id
  route_table_id = aws_route_table.project02-rt-private1.id
}

resource "aws_route_table_association" "project02-rt-private2" {
  subnet_id      = aws_subnet.project02-subnet-private2.id
  route_table_id = aws_route_table.project02-rt-private2.id
}

