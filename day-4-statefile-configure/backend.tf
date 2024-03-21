terraform {
  backend "s3" {
    bucket = "abuzarsyed0711"
    key    = "linux"
    region = "us-east-1"
    dynamodb_table = "terraform-state-lock-dynamo" 
    encrypt        = true 

  }
}