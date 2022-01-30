variable "region" {
  default = "eu-west-1"
  type = string
}

variable "cluster-name" {
  default = "mqbr-eks-cluster"
  type    = string
}
variable "RDS_name"{
  default = "mqbrRDS"
  type = string
}
variable "RDS_username"{
  default = "mqbr"
  type = string
}
variable "RDS_password"{
  default = "nW=-P7tz"
  type = string
}
variable "ssh_key_name"{
  default = "mqbr-wp-key"    //must be Present in AWS EC2 in Your Region
  type = string
}