provider "aws" { 
    region  = "us-west-1"
    access_key = "--"
    secret_key = "---"
}

# resource "aws_instance" "ec2_example" { 
#     ami = "ami-07d2649d67dbe8900" // image of os
#     instance_type = var.instance_type   // CPU
#     tags   ={
#         Name = "terraform-ec2"
#     }    
# }

resource "aws_instance" "ec2_example" { 
    ami = "ami-07d2649d67dbe8900" // image of os
    instance_type = var.instance_type   // CPU
   tags = var.project_env
}

resource "aws_iam_user" "user" {
  count = length(var.users)
  name = var.users[count.index]
}

variable "users" {
    description = "List of users"
    type = list(string)
    default = ["user1", "user2"]
}

variable "project_env" {
    description = "Project environment"
    type = map(string)   #dictionary type , key = project, value = project-alpha 
    default = {
        project = "project-alpha",
        environment = "dev"
    }
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t2.micro"

}


