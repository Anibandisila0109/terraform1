resource "aws_instance" "test" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    subnet_id = "subnet-07f15dfa8e613cca5"
    key_name = "linux"
    depends_on = [ aws_instance.test ]
  
}
 
resource "aws_s3_bucket" "test" {
    bucket = "wertyujhgfcv"
    
  
}
 