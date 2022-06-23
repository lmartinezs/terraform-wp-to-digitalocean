## Creamos un dominio nuevo
#
#data "cloudflare_zone" "this" {
#  name = "arcashoes.com"
#}
#
## Add a record to the domain
#resource "cloudflare_record" "mail" {
#  zone_id = data.cloudflare_zone.this.id
#  type   = "A"
#  name   = "mail"
#  ttl    = "30"
#  value  = digitalocean_droplet.mail.ipv4_address
#}
#
## Add mx record to the domain (so it can receive emails)
#resource "cloudflare_record" "mx" {
#  zone_id = data.cloudflare_zone.this.id
#  type   = "MX"
#  name   = "@"
#  priority    = "10"
#  ttl    = "14400"
#  value  = "mail.${var.domain}."
#}
#
## SPF
#resource "cloudflare_record" "spf" {
#  zone_id = data.cloudflare_zone.this.id
#  type   = "TXT"
#  name   = "@"
#  ttl    = "14400"
#  value  = "v=spf1 mx ~all"
#}
#
## DMARC
#resource "cloudflare_record" "dmarc" {
#  zone_id = data.cloudflare_zone.this.id
#  type   = "TXT"
#  name   = "_dmarc.${var.domain}"
#  ttl    = "14400"
#  value  = "v=DMARC1; p=none; rua=mailto:dmarc-reports@${var.domain}"
#}
#
## SMTP
#resource "cloudflare_record" "smtp" {
#  zone_id = data.cloudflare_zone.this.id
#  type   = "CNAME"
#  name   = "smtp"
#  ttl    = "14400"
#  value  = "mail.${var.domain}."
#}
#
## POP
#resource "cloudflare_record" "pop" {
#  zone_id = data.cloudflare_zone.this.id
#  type   = "CNAME"
#  name   = "pop"
#  ttl    = "14400"
#  value  = "mail.${var.domain}."
#}
#
## IMAP
#resource "cloudflare_record" "imap" {
#  zone_id = data.cloudflare_zone.this.id
#  type   = "CNAME"
#  name   = "imap"
#  ttl    = "14400"
#  value  = "mail.${var.domain}."
#}