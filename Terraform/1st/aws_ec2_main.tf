provider "aws" { 
    region  = "us-east-1"
    access_key = ""
    secret_key = ""
}

resource "aws_instance" "ec2_example" { 
    ami         = "ami-0d413c682033e11fd" // image of ps
    instance_type = "t2.micro"   // CPU
    tags   ={
        Name = "terraform-ec2"
    }    
}

# resource "aws_security_group" "default" {
#   name        = "terraform-ec2"
#   description = "Allow all inbound and outbound traffic"

#   ingress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }