variable "digitalocean_token" {}
variable "cloudflare_email" {}
variable "cloudflare_api_key" {}

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "1.22.2"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.digitalocean_token
}

# Configure the Cloudflare Provider
provider "cloudflare" {
  email   = var.cloudflare_email
  api_token = var.cloudflare_api_key
}
