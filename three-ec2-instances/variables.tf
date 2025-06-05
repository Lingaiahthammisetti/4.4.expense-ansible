variable "allow_all" {
   type = string
   default = "sg-09c7c70bd56f0d58b"
}
variable "zone_id" {
    default = "Z07608533HHBQHW47XU3F"
}
variable "domain_name" {
  default = "lingaiah.online"
}
variable "instances" {
    type     = map
    default = {
        db     = "t2.small"
        backend   = "t2.micro"
        frontend  = "t2.micro"
    }
}