terraform {
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "=2.2.0"
    }
  }
}

provider "http" {}

data "http" "example" {
  url = "https://checkpoint-api.hashicorp.com/v1/check/terraform"

  request_headers = {
    Accept = "application/json"
  }
}

# body is deprecated use response_body instead
output "display_body" {
  value = jsondecode(data.http.example.body)
}

output "display_responsebody" {
  value = jsondecode(data.http.example.response_body)
}

output "display_id" {
  value = data.http.example.id
}

output "display_responseheaders" {
  value = data.http.example.response_headers
}
