variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-2"
}

variable "aws_profile" {
  description = "AWS profile"
  default     = "default"
}


variable "ami" {
  description = "ems_ami"
}

variable "instance" {
  description = "ems_instance"
}

variable "servername" {
  description = "instance_name"
}

variable "size" {
  description = "volume size"
}
