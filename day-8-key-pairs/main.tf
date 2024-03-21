

provider "aws" {
    region = "us-east-1"
  
}

resource "aws_key_pair" "linux" {
key_name = "server1"
public_key =file("~/.ssh/id_ed25519.pub")

}
 resource "aws_instance" "server2" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name = aws_key_pair.linux.key_name
 }

provider "aws" {
    region = "us-east-1"
  
}

resource "aws_key_pair" "linux" {
key_name = "server1"
public_key =file("~/.ssh/id_ed25519.pub")

}
 resource "aws_instance" "server2" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name = aws_key_pair.linux.key_name

provider "aws" {
    region = "us-east-1"
  
}

resource "aws_key_pair" "linux" {
key_name = "server1"
public_key =file("~/.ssh/id_ed25519.pub")

}
 resource "aws_instance" "server2" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name = aws_key_pair.linux.key_name
 }
 