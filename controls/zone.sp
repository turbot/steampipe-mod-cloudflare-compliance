benchmark "zone_best_practices" {
  title = "Zone Best Practices"
  description = "Best practices for your zones."
  children = [
    control.zone_dnssec_enabled,
    control.zone_min_tls_1_2
  ]
}

control "zone_dnssec_enabled" {
  title = "Zones should have DNSSEC enabled"
  description = "DNSSEC adds an extra layer of authentication layer to DNS, making sure that visitors go to your domain instead of a spoofed domain."
  sql = <<-EOT
    select
      id as resource,
      case
        when (dnssec ->> 'status') = 'active' then 'ok'
        else 'alarm'
      end as status,
      name || ' DNSSEC is ' || (dnssec ->> 'status') || '.' as reason
    from
      cloudflare_zone
  EOT
}

control "zone_min_tls_1_2" {
  title = "Zones should have a minimum TLS version of 1.2 or higher"
  description = "A higher TLS version implies a stronger cryptographic standard due to fixes for known vulnerabilities and additional security."
  sql = <<-EOT
    select
      id as resource,
      case
        when (settings ->> 'min_tls_version') in ('1.2', '1.3') then 'ok'
        else 'alarm'
      end as status,
      name || ' min TLS version is ' || (settings ->> 'min_tls_version') || '.' as reason
    from
      cloudflare_zone
  EOT
}

