resource "aws_instance" "dev1" {
    ami = "ami-066784287e358dad1"
    instance_type = "t2.micro"
    key_name = "virginia"
    tags = {
      Name="mohit"
    }
  
}