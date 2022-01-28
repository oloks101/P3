variable "region" {
  default = "ap-southeast-1"
  type = string
}

variable "cluster-name" {
  default = "do4m-eks-cluster"
  type    = string
}
variable "RDS_name"{
  default = "do4m-rds"
  type = string
}
variable "RDS_username"{
  default = "do4madmin"
  type = string
}
variable "RDS_password"{
  default = "N@jib1607"
  type = string
}
variable "ssh_key_name"{
  default = "do4m-wp-key"    //must be Present in AWS EC2 in Your Region
  type = string
}