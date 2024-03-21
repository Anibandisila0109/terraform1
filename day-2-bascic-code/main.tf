resource "aws_instance" "dev" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = var.instance_type
    key_name = var.key_name
    tags = {
       Name ="demo2"
    }
  
}