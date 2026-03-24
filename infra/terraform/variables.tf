variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  description = "EC2 Key Pair"
  default     = "devops"
}

variable "ami_id" {
  description = "Ubuntu 24 AMI"
  default     = "ami-02dfbd4ff395f2a1b" 
}
