variable "region" {
  default = "us-east-1"
  type = string
}

variable "cluster-name" {
  default = "mqbr-eks-cluster"
  type    = string
}
variable "db_name"{
  default = "mqbr"
  type = string
}
variable "db_username"{
  default = "mqbr"
  type = string
}
variable "db_password"{
  default = "nW=-P7tz"
  type = string
}
variable "ssh_key_name"{
  default = "SpiceGirlsParadise"    //must be Present in AWS EC2 in Your Region
  type = string
}