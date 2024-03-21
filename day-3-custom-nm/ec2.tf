resource "aws_instance" "dev" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name = "linux"
    subnet_id = aws_subnet.dev.id
    security_groups = [aws_security_group.dev.id]
    tags = {
      Name = "ec2"
    }
  
}