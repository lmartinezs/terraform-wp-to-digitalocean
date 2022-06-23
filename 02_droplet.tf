#
# Creamos el droplet

variable "domain" {
   default = "arcashoes.com"
}

resource "digitalocean_droplet" "server" {
  image     = "ubuntu-20-04-x64"
  name      = "server.${var.domain}"
  region    = "nyc1"
  size      = "s-1vcpu-1gb"
  user_data = file("userdata.yaml")
  ssh_keys  = ["${digitalocean_ssh_key.lazaro.fingerprint}"]
}

#Add records to Cloudflare DNS
data "cloudflare_zone" "this" {
  name = "arcashoes.com"
}

resource "cloudflare_record" "cname_record" {
  zone_id = data.cloudflare_zone.this.id
  name    = "www"
  value   = "${var.domain}"
  type    = "CNAME"
  ttl     = 60
}

resource "cloudflare_record" "typea" {
  zone_id = data.cloudflare_zone.this.id
  name    = "${var.domain}"
  value   = digitalocean_droplet.server.ipv4_address
  type    = "A"
  ttl     = 60
  depends_on = [
    digitalocean_droplet.server
  ]
}


output "instance_ip_addr" {
  value = digitalocean_droplet.server.ipv4_address
}

