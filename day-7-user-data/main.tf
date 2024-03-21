provider "aws" {
    region = "us-east-1"
  
}
resource "aws_instance" "demo12" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name = "linux"
    user_data = file("test.sh")
    tags = {
      Name = "userdata123"
    }
}
  
