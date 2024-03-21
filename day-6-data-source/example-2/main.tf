provider "aws" {
    region = "us-east-1"
  
}

data "aws_vpc" "dev" {
  filter {
    name = "tag:Name"
    values = ["dev"] #giv your vpc name 
  }
}

data "aws_subnet" "dev" {
  filter {
    name = "tag:Name"
    values = ["mydevsub"] # give your subnet name 
  }
}

resource "aws_security_group" "dev" {
  name        = "allow_tls"
  vpc_id      = data.aws_vpc.dev.id
  tags = {
    Name = "dev_sg"
  }
 
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }



egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }


  }
  

resource "aws_instance" "dev" {
  ami ="ami-02d7fd1c2af6eead0"
  instance_type = "t2.micro"
  key_name = "linux"
  security_groups = [ aws_security_group.dev.id ]
  subnet_id =  "data.aws_subnet.mydevsub.id"
  tags = {
    Name = "DataSource- Instance"
  }
}