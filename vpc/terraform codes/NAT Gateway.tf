# Configure the AWS provider
provider "aws" {
  region = "us-east-1"  # Change to your desired AWS region
}

# Create a VPC (Virtual Private Cloud)
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"  # Replace with your desired VPC CIDR block
}

# Create a public subnet (optional, for the NAT Gateway)
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"  # Replace with your desired public subnet CIDR block
  availability_zone = "us-east-1a"  # Replace with your desired availability zone
  map_public_ip_on_launch = true  # Enables auto-assigning public IPs to instances in this subnet
}

# Create a private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"  # Replace with your desired private subnet CIDR block
  availability_zone = "us-east-1b"  # Replace with your desired availability zone
}

# Create a security group for NAT Gateway (allowing outbound traffic)
resource "aws_security_group" "nat_sg" {
  name        = "nat-sg"
  description = "Security group for NAT Gateway"
  vpc_id      = aws_vpc.my_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an Elastic IP for the NAT Gateway
resource "aws_eip" "nat_eip" {}

# Create a NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id
}

# Create a route table for the private subnet
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_vpc.id
}

# Associate the private subnet with the private route table
resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

# Create a default route in the private route table to send traffic to the NAT Gateway
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}
