# nested_maps
A small Terraform module to build a nested map for for_each resource declarations

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| map | A map of resource names and element names | `map(string)` | n/a | yes |
| replace | A map of information for string replacement | <pre>map(object({<br>    string_find    = string<br>    string_replace = map(string)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| map | A map to use in a for\_each loop |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
