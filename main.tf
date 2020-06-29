variable "map" {
  description = "A map of resource names and element names"
  type        = map(string)
}

variable "replace" {
  description = "A map of information for string replacement"
  type = map(object({
    string_find    = string
    string_replace = map(string)
  }))
}

locals {
  keys   = flatten([for s in var.replace["string_replace"] : [for k, v in var.map : replace(k, var.replace["string_find"], s)]])
  values = flatten([for s in var.replace["string_replace"] : [for k, v in var.map : map("name", replace(v, var.replace["string_find"], s))]])
}

output "map" {
  description = "A map to use in a for_each loop"
  value       = zipmap(local.keys, local.values)
}
