variable "vpc_cidr_block" {
  description = "CIDR Block for VPC"
  default = "10.1.0.0/16"
}

variable "cidr_block" {
  description = "cidr block to create redis in"
  default = ["10.1.1.0/24", "10.1.2.0/24"]
}

variable "namespace" {
  description = "Default namespace"
}

variable "cluster_id" {
  description = "id to assign the new cluster"
}

variable "public_key_path" {
  description = "path to public key"
  default = "~/.ssh/id_rsa.pub"
}

variable "node_groups" {
  description = "Number  nodes group to create n the cluster"
  default = 3
}





