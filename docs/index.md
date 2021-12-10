---
repository: "https://github.com/turbot/steampipe-mod-cloudflare-sherlock"
---

# Cloudflare Sherlock Mod

Interrogate your Cloudflare resources with the help of the world's greatest detectives: Steampipe + Sherlock.

## References

[Cloudflare](https://cloudflare.com/) is a global network designed to make everything you connect to the Internet secure, private, fast, and reliable.a provider of Internet hosting for software development and version control using Git.

[Steampipe](https://steampipe.io) is an open source CLI to instantly query cloud APIs using SQL.

[Steampipe Mods](https://steampipe.io/docs/reference/mod-resources#mod) are collections of `named queries`, and codified `controls` that can be used to test current configuration of your cloud resources against a desired configuration.


## Documentation

- **[Benchmarks and controls →](https://hub.steampipe.io/mods/turbot/_sherlock/controls)**
- **[Named queries →](https://hub.steampipe.io/mods/turbot/_sherlock/queries)**

## Get started

Install the Cloudflare plugin with [Steampipe](https://steampipe.io):

```shell
steampipe plugin install cloudflare
```

Clone:

```sh
git clone https://github.com/turbot/steampipe-mod-cloudflare-sherlock.git
cd steampipe-mod--sherlock
```

Run all benchmarks:

```shell
steampipe check all
```

Run a benchmark:

```shell
steampipe check benchmark.TBD
```

Run a specific control:

```shell
steampipe check control.TBD
```

### Credentials

This mod uses the credentials configured in the [Steampipe Cloudflare plugin](https://hub.steampipe.io/plugins/turbot/cloudflare).

### Configuration

No extra configuration is required.

## Get involved

* Contribute: [Cloudflare Repo](https://github.com/turbot/steampipe-mod-cloudflare-sherlock)
* Community: [Slack Channel](https://steampipe.io/community/join)
