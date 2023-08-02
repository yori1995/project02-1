output "vpc-id" {
  value = aws_vpc.project02-vpc.id
}

output "public-subnet2a" {
  value = aws_subnet.project02-subnet-public1.id
}

output "public-subnet2c" {
  value = aws_subnet.project02-subnet-public2.id
}

output "private-subnet2a" {
  value = aws_subnet.project02-subnet-private1.id
}

output "private-subnet2c" {
  value = aws_subnet.project02-subnet-private2.id
}
