benchmark "account_best_practices" {
  title       = "Account Best Practices"
  description = "Best practices for your accounts."
  children = [
    control.account_enforces_two_factor,
    control.api_token_age_90
  ]
}

control "account_enforces_two_factor" {
  title       = "Accounts should enforce two-factor authentication for all members"
  description = "Two-factor authentication makes it harder for unauthorized actors to access accounts."
  sql         = <<-EOT
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

control "api_token_age_90" {
  title       = "API tokens should be rotated at least every 90 days"
  description = "API Tokens provide a way to authenticate with the Cloudflare API. They allow for scoped and permissioned access to resources. It is recommended that the API tokens are rotated as per account requirement."
  sql         = <<-EOT
    select
      -- Required Columns
      id as resource,
      case
        when issued_on <= (current_date - interval '90' day) then 'alarm'
        else 'ok'
      end status,
      name || ' (' || id || ') created ' || to_char(issued_on , 'DD-Mon-YYYY') ||
        ' (' || extract(day from current_timestamp - issued_on) || ' days).'
      as reason,
      -- Additional Dimensions
      name
    from
      cloudflare_api_token;
  EOT
}
