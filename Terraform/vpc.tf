provider "aws" {
  region     = "us-west-2"
  access_key = "AKIAZ7Z2Z7W6RLMHKXMQ"
  secret_key = "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"
} 
resource "aws_vpc" "mynetwork" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true 

  tags = {
    Name = "network"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.mynetwork.id

  tags = {
    Name = "network-igw"
  }
}
resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.mynetwork.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = "PublicRT"
  }
}
resource "aws_route_table" "PrivateRT" {
  vpc_id = aws_vpc.mynetwork.id
  tags = {
    Name = "PrivateRT"
  }
}
resource "aws_subnet" "publicsub" {
  vpc_id     = aws_vpc.mynetwork.id
  cidr_block = "192.168.0.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "publicsubnet"
  }
} 
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.publicsub.id
  route_table_id = aws_route_table.publicRT.id
} 
resource "aws_subnet" "privatesub" {
  vpc_id     = aws_vpc.mynetwork.id
  cidr_block = "192.168.1.0/24"
  availability_zone = "us-west-2b"

  tags = {
    Name = "privatesubnet"
  }
} 
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.privatesub.id
  route_table_id = aws_route_table.PrivateRT.id
}  
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.mynetwork.id

  ingress {
    description = "TLS from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
resource "aws_instance" "web" {
  ami           = "ami-07a29e5e945228fa1"
  instance_type = "t2.micro"
  key_name = "terraform" 
  vpc_security_group_ids = ["aws_security_group.allow_tls.id"]
  subnet_id = aws_subnet.publicsub.id 
  associate_public_ip_address = true 
  tags = {
    Name = "HelloWorld"
  }
}




