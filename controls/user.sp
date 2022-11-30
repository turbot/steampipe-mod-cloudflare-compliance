benchmark "user_best_practices" {
  title       = "User Best Practices"
  description = "Best practices for your users."
  children = [
    control.user_two_factor_enabled
  ]
}

control "user_two_factor_enabled" {
  title       = "Users should have two-factor authentication enabled"
  description = "Two-factor authentication makes it harder for unauthorized actors to access users."
  sql         = <<-EOT
    select
      id as resource,
      case
        when two_factor_authentication_enabled then 'ok'
        else 'alarm'
      end as status,
      email || case when two_factor_authentication_enabled then ' has 2FA enabled' else ' does not have 2FA enabled' end || '.' as reason
    from
      cloudflare_user
  EOT
}
