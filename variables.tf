variable "developer" {
  type    = list(string)
  #default = ["developer","developer1","developer3"]
}

variable "admin" {
  type    = list(string)
  #default = ["admin1", "admin2","admin3"]
}

variable "env" {
  type    = list(any)
  default = ["Development", "Production"]
}

variable "tags" {
  type = map(string)
  default = {
    Env = "Production"
  }
}