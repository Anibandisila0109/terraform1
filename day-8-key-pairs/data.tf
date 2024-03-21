data "aws_ami" "amzlinux" {
    most_recent = true
    owners = ["amazon"]

    filter {
      name = "name"
      values = ["amzn2-ami-hvm-*-gp2"]

    }
     filter {
       name = "root-device-type"
       values = ["ebs"]
     }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
     
   }
}
 data "aws_security_group" "dev"  {
   id = "sg-0d967189305853a54"

}  

 data "aws_subnet" "dev" {
    id = "subnet-0b0f2fd38ab2ccca3"

 }