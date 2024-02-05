variable "vpc_id" {
  default = "vpc-f35" #VPC ID here
}

variable "subnet_ids" {
  type    = list(string)
  default = ["subnet-d4", "subnet-fb"] #right subnets here
}

variable "aws_region" {
  default = "us-east-1"
}

variable "aws_access_key" {
  default   = ""
  sensitive = true
}

variable "aws_secret_key" {
  default   = ""
  sensitive = true
}