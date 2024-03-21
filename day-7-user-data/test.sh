#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo service httpd start  
sudo systemctl enable httpd
chkconfig httpd on
echo "Welcome to Naresh IT AWS Infra created using Terraform in us-east-1 Region" > /var/www/html/index.html