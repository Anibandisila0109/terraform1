# creat vpc #
resource "aws_vpc" " demo " {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "dev"
    }
  
}
#creat ig &attach to vpc #
resource "aws_internet_gateway" "dev" {
    vpc_id = aws_vpc.dev.id
  
}
# creat subnet #
 resource "aws_subnet" "dev" {
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.dev.id
   
 }
 # creat pvt subnet
  resource "aws_subnet" "dev1" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.dev.id
    
  }
  # creat ip #
  resource "aws_eip" "devip" {
    tags = {
      Name = "eip"
    }
    
  }
 # creat route & edit routes #
 resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.dev.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev.id

    }
   
 }
 # subnet association #
  resource "aws_route_table_association" "name" {
    route_table_id = aws_route_table.dev.id
    subnet_id = aws_subnet.dev.id
    
  }
  # creat natgateway #
  resource "aws_nat_gateway" "ng1" {
    subnet_id = aws_subnet.dev.id
    allocation_id = aws_eip.devip.id
    tags = {
      Name = "ng1"
    }
    
  }
  # creat routbale in nat gateway #
   resource "aws_route_table" "dev1" {
      vpc_id = aws_vpc.dev.id
    route {
     cidr_block = "0.0.0.0/0"
     gateway_id = aws_nat_gateway.ng1.id

    }
    tags = {
    Name = " dev1 "
    }
    
     
   }
   # subnet association pvt #
   resource "aws_route_table_association" "dev" {
    route_table_id = aws_route_table.dev
    subnet_id = aws_subnet.dev1
     
   }
  # creat security group #
  resource "aws_security_group" "dev" {
    name = "allow_tls"
    vpc_id =   aws_vpc.dev.id
    tags = {
        Name = "devsg"
    } 
    ingress {
        description = "TLS from vpc"
        from_port = 80
        to_port   = 80
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "TLS from vpc" 
        from_port   = 22
        to_port     = 22
        protocol    = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port   = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
          }

  }
