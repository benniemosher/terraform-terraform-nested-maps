variable "map" {}
variable "replace" {}

locals {
  keys   = flatten([for s in var.replace["string_replace"] : [for k, v in var.map : replace(k, var.replace["string_find"], s)]])
  values = flatten([for s in var.replace["string_replace"] : [for k, v in var.map : map("name", replace(v, var.replace["string_find"], s))]])
}

output "map" {
  value = zipmap(local.keys, local.values)
}
