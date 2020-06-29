# terraform-nested-maps

A small Terraform module to build a nested map to use with`for_each` resource declarations.

I wanted to condence 100+ lines of remote data sources to pull in resources, and I wanted to utilize the new `for_each` feature.

This could easily go in one file and not be a module, but this allows me to use the same method for things like `vpc_peering_connections`.

I wanted to use this module method because it now gives me really neat names like `aws_security_group.this['cms-dev']`. This makes it pretty easy to move and refactor these as they still have the same name:

```bash
tf plan > plan.tfplan
cat plan.tfplan | grep "destroyed" # creates output like `data.aws_security_group.cms-dev`
cat plan.tfplan | grep "created" # creates output like `data.aws_security_group.this["cms-dev"]`
```

You can then take the above `grep'd` output and paste it into a Text Editor and match up the names for easy state move commands.

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
