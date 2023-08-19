# PROVIDER
provider "aws" {
  region = "ap-northeast-2"
}

# VPC 생성
resource "aws_vpc" "project02-vpc" {
  cidr_block       = "10.2.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "project02-vpc"
  }
}

# PUBLIC SUBNET 1 생성 
resource "aws_subnet" "project02-subnet-public1" {
  vpc_id            = aws_vpc.project02-vpc.id
  cidr_block        = "10.2.101.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "project02-subnet-public1-ap-northeast-2a"
  }
}

# PUBLIC SUBNET 2 생성 
resource "aws_subnet" "project02-subnet-public2" {
  vpc_id            = aws_vpc.project02-vpc.id
  cidr_block        = "10.2.103.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "project02-subnet-public2-ap-northeast-2c"
  }
}

# PRIVATE SUBNET 1 생성
resource "aws_subnet" "project02-subnet-private1" {
  vpc_id            = aws_vpc.project02-vpc.id
  cidr_block        = "10.2.1.0/24"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "project02-subnet-private1-ap-northeast-2a"
  }
}

# PRIVATE SUBNET 2 생성
resource "aws_subnet" "project02-subnet-private2" {
  vpc_id            = aws_vpc.project02-vpc.id
  cidr_block        = "10.2.3.0/24"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "project02-subnet-private2-ap-northeast-2c"
  }
}

# Internet Gateway 생성
resource "aws_internet_gateway" "project02-igw" {
  vpc_id = aws_vpc.project02-vpc.id

  tags = {
    Name = "project02-igw"
  }
}

# 탄력적 IP 생성
resource "aws_eip" "project02-eip" {
  domain     = "vpc"
  depends_on = ["aws_internet_gateway.project02-igw"]

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "project02-eip"
  }
}

# NAT Gateway 생성성
resource "aws_nat_gateway" "project02-nat" {
  allocation_id = aws_eip.project02-eip.id
  subnet_id     = aws_subnet.project02-subnet-public1.id

  tags = {
    Name = "project02-nat-public1-ap-northeast-2a"
  }
}

# Public Routing Table 생성
resource "aws_default_route_table" "project02-rt-public" {
  default_route_table_id = aws_vpc.project02-vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project02-igw.id
  }

  tags = {
    Name = "project02-rt-public"
  }
}

# Private Routing Table 1 생성
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

# Private Routing Table 2 생성
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

# Public Routing Table Subnet 연결
resource "aws_route_table_association" "project02-rt-public1" {
  subnet_id      = aws_subnet.project02-subnet-public1.id
  route_table_id = aws_vpc.project02-vpc.default_route_table_id
}

# Public Routing Table Subnet 연결
resource "aws_route_table_association" "project02-rt-public2" {
  subnet_id      = aws_subnet.project02-subnet-public2.id
  route_table_id = aws_vpc.project02-vpc.default_route_table_id
}

# Private Routing Table Subnet 연결
resource "aws_route_table_association" "project02-rt-private1" {
  subnet_id      = aws_subnet.project02-subnet-private1.id
  route_table_id = aws_route_table.project02-rt-private1.id
}

# Private Routing Table Subnet 연결
resource "aws_route_table_association" "project02-rt-private2" {
  subnet_id      = aws_subnet.project02-subnet-private2.id
  route_table_id = aws_route_table.project02-rt-private2.id
}

