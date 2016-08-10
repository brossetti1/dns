variable "env_name" {}

resource "aws_route53_zone" "presidentialinnovationfellows_toplevel" {
   name = "presidentialinnovationfellows.gov"

   tags {
     Project = "dns"
   }
}

resource "aws_route53_record" "presidentialinnovationfellows_www" {
  zone_id = "${aws_route53_zone.presidentialinnovationfellows_toplevel.zone_id}"
  name = "www.presidentialinnovationfellows.gov."
  type = "A"

  alias {
    name = "s3-website-us-east-1.amazonaws.com."
    zone_id = "Z3AQBSTGFYJSTF"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "presidentialinnovationfellows_apex" {
  zone_id = "${aws_route53_zone.presidentialinnovationfellows_toplevel.zone_id}"
  name = "presidentialinnovationfellows.gov."
  type = "A"

  alias {
    name = "d3bkdguil46vp.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "presidentialinnovationfellows_mx" {
  zone_id = "${aws_route53_zone.presidentialinnovationfellows_toplevel.zone_id}"
  name = "presidentialinnovationfellows.gov."
  type = "MX"
  ttl = 60
  records = ["10 alt3.aspmx.l.google.com.", "10 alt4.aspmx.l.google.com.", "1 aspmx.l.google.com.", "5 alt1.aspmx.l.google.com.", "5 alt2.aspmx.l.google.com."]
}

resource "aws_route53_record" "presidentialinnovationfellows_apex_txt" {
  zone_id = "${aws_route53_zone.presidentialinnovationfellows_toplevel.zone_id}"
  name = "presidentialinnovationfellows.gov."
  type = "TXT"
  ttl = 60
  records = ["google-site-verification=RBhAMKMQvrHWfxNfosQ9oUrrcwAme78JlrhD3cTQCvY"]
}

resource "aws_route53_record" "presidentialinnovationfellows_amazonses" {
  zone_id = "${aws_route53_zone.presidentialinnovationfellows_toplevel.zone_id}"
  name = "_amazonses.presidentialinnovationfellows.gov."
  type = "TXT"
  ttl = 1800
  records = ["7q2e04OSN64Ey2OfWI9cHmvQ3ZmG3c/u+N8BzZtxMgU="]
}

resource "aws_route53_record" "presidentialinnovationfellows_domainkey_1" {
  zone_id = "${aws_route53_zone.presidentialinnovationfellows_toplevel.zone_id}"
  name = "7fz4jdqdwujjhu2p2kk7az3ttz7amtql._domainkey.presidentialinnovationfellows.gov."
  type = "CNAME"
  ttl = 1800
  records = ["7fz4jdqdwujjhu2p2kk7az3ttz7amtql.dkim.amazonses.com"]
}

resource "aws_route53_record" "presidentialinnovationfellows_domainkey_2" {
  zone_id = "${aws_route53_zone.presidentialinnovationfellows_toplevel.zone_id}"
  name = "jqewov2ncvy7kbnvsphmkpuhsrrdxgpi._domainkey.presidentialinnovationfellows.gov."
  type = "CNAME"
  ttl = 1800
  records = ["jqewov2ncvy7kbnvsphmkpuhsrrdxgpi.dkim.amazonses.com"]
}

resource "aws_route53_record" "presidentialinnovationfellows_domainkey_3" {
  zone_id = "${aws_route53_zone.presidentialinnovationfellows_toplevel.zone_id}"
  name = "xj5lii5m5qopbxzuxy4fblxbgbf2cq3e._domainkey.presidentialinnovationfellows.gov."
  type = "CNAME"
  ttl = 1800
  records = ["xj5lii5m5qopbxzuxy4fblxbgbf2cq3e.dkim.amazonses.com"]
}

output "pif_ns" {
    value="${aws_route53_zone.presidentialinnovationfellows_toplevel.name_servers}"
}
