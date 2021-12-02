mod "cloudflare_sherlock" {
  # Hub metadata
  title         = "Cloudflare Sherlock"
  description   = "Interrogate your Cloudflare resources with the help of the world's greatest detectives: Steampipe + Sherlock."
  color         = "#f48120"
  documentation = file("./docs/index.md")
  icon          = "/images/mods/turbot/cloudflare-sherlock.svg"
  categories    = ["best practices", "cloudflare", "sherlock", "internet"]

  opengraph {
    title        = "Steampipe Mod to Analyze Cloudflare"
    description  = "Interrogate your Cloudflare resources with the help of the world's greatest detectives: Steampipe + Sherlock."
    image        = "/images/mods/turbot/cloudflare-sherlock-social-graphic.png"
  }

  requires {
    plugin "cloudflare" {
      version = "0.1.0"
    }
  }
}
