terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
  }
}

resource "random_string" "res_string" {
  length  = 6
  special = false
  upper   = false
  #  number  = true   # this field is deprecated, and will be removed in next major release
  numeric   = true
  lower     = true
  min_lower = 4
}

output "some_string" {
  value = random_string.res_string.result
}

resource "random_password" "res_pwd" {
  length           = 12
  special          = true
  override_special = "!@#$"
  min_upper        = 2
  min_lower        = 2
  min_numeric      = 2
  min_special      = 2
}

# password value should only used as input for other fields and not output
output "some_pwd" {
  value     = random_password.res_pwd.result
  sensitive = true
}
