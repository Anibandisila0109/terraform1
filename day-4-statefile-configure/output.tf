output "public" {
    value = aws_instance.net.public_ip
    sensitive = true
  
}
 output "private" {
    value = aws_instance.net.private_ip
   
 }
 