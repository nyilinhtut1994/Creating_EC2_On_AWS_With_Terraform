variable "ami_id" {
    type = string
    default = "ami-0e4b5d31e60aa0acd"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "key_pair" {
    type = string
    default = "your key_pair Name"
}
    
variable "security_group" {
    type = string
    default = "sg-0d150217a07c29aca"
}