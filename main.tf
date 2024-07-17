resource "null_resource" "example" {
}

resource "null_resource" "example2" {
}

data "curl_request" "google" {
  uri         = "https://google.com"
  http_method = "GET"
}

output "google" {
  value = {
    status_code = data.curl_request.google.response_status_code
    body        = data.curl_request.google.response_body
  }
}