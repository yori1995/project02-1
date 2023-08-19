# VPC ID OUTPUT
output "vpc-id" {
  value = aws_vpc.project02-vpc.id
}

# PUBLIC SUBNET ID OUTPUT
output "public-subnet2a" {
  value = aws_subnet.project02-subnet-public1.id
}

# PUBLIC SUBNET ID OUTPUT
output "public-subnet2c" {
  value = aws_subnet.project02-subnet-public2.id
}

# PRIVATE SUBNET ID OUTPUT
output "private-subnet2a" {
  value = aws_subnet.project02-subnet-private1.id
}

# PRIVATE SUBNET ID OUTPUT
output "private-subnet2c" {
  value = aws_subnet.project02-subnet-private2.id
}
