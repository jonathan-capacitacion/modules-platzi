variable "ami_id" {
  default     = ""
  description = "Ami Id"
}
variable "instance_type" {
  default     = ""
  description = "Instance Type"
}
variable "tags" {
  description = "Tags of instance"
  type        = map(any)
}
variable "sg_name" {

}
variable "ingress_rules" {

}
variable "egress_rules" {
  
}