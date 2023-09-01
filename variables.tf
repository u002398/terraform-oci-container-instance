variable "compartment_ocid" {
  type    = string
  default = null
}

variable "subnet_id" {
  type    = string
  default = null
}

variable "container_instance" {
  type    = map(string)
  default = null
}

