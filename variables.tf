variable "developer" {
  type    = list(string)
}

variable "admin" {
  type    = list(string)
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