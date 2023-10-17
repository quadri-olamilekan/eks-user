variable "developer" {
  type = list(any)
}

variable "admin" {
  type = list(any)
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