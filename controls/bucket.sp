benchmark "r2_bucket_best_practices" {
  title       = "R2 Bucket Best Practices"
  description = "Best practices for your Cloudflare R2 Bucket."
  children = [
    control.r2_bucket_default_encryption_enabled
  ]
}

control "r2_bucket_default_encryption_enabled" {
  title       = "R2 bucket default encryption should be enabled"
  description = "To help protect data at rest, ensure encryption is enabled for your Cloudflare R2 buckets."
  sql         = <<-EOT
    select
      -- Required Columns
      b.name as resource,
      case
        when server_side_encryption_configuration is not null then 'ok'
        else 'alarm'
      end status,
      case
        when server_side_encryption_configuration is not null then b.name || ' default encryption enabled.'
        else b.name || ' default encryption disabled.'
      end reason,
      -- Additional Dimensions
      b.region,
      b.account_id
    from
      cloudflare_r2_bucket as b
      inner join cloudflare_account as a on b.account_id = a.id;
  EOT
}
