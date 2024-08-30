resource "aws_vpc" "Name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name="cust_vpc"
    }

}
resource "aws_subnet" "public" {
    vpc_id=aws_vpc.Name.id
    cidr_block= "10.0.0.0/24"
    tags={
        Name= "pub"
    }
}
resource "aws_subnet" "pvt" {
vpc_id = aws_vpc.Name.id
cidr_block = "10.0.8.0/24"
tags = {
  Name="pvt"
}
}
resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.Name.id
    tags = {
      Name="ig"
    }
  
}
resource "aws_route_table" "name" {
  vpc_id = aws_vpc.Name.id
  tags = {
    Name="route1"
  }
route {
    gateway_id = aws_internet_gateway.name.id
    cidr_block = "0.0.0.0/0"
    }
}
resource "aws_route_table_association" "name" {
route_table_id = aws_route_table.name.id
subnet_id = aws_subnet.public.id
}
resource "aws_security_group" "sg1" {
  vpc_id = aws_vpc.Name.id
  tags = {
    name="sg1"
  }
ingress {
    description = "allow from vpc"
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}
egress {
    description = "allow from vpc"
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

}


