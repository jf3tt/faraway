output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = aws_subnet.public.*.id
}

# output "public_subnet_id" {
#   value = aws_subnet.public.*.id
# }

output "internet_gateway_id" {
  value = aws_internet_gateway.main.id
}

output "route_table_id" {
  value = aws_route_table.private.id
}

output "aws_subnet" {
  value = aws_subnet.private[*].id
}