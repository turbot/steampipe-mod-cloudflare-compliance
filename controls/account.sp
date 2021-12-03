benchmark "account_best_practices" {
  title = "Account Best Practices"
  description = "Best practices for your accounts."
  children = [
    control.account_enforces_two_factor
  ]
}

control "account_enforces_two_factor" {
  title = "Accounts should enforce two-factor authentication for all members"
  description = "Two-factor authentication makes it harder for unauthorized actors to access accounts."
  sql = <<-EOT
    select
      id as resource,
      case
        when (settings -> 'enforce_twofactor')::bool then 'ok'
        else 'alarm'
      end as status,
      name || case when (settings -> 'enforce_twofactor')::bool then ' enforces 2FA' else ' does not enforce 2FA' end || '.' as reason
    from
      cloudflare_account
  EOT
}
