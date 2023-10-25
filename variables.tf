variable "developer" {
  type    = list(string)
  default = ["developer","developer1"]
}

variable "admin" {
  type    = list(string)
  default = ["admin","admin1", "admin2"]
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