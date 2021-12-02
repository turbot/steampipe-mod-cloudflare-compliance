# Cloudflare Sherlock

Interrogate your Cloudflare resources with the help of the World's greatest
detectives: Steampipe + Sherlock. Cloudflare Sherlock allows you to perform
deep analysis of your Cloudflare resources and test them against operations &
security best practices.

![image](https://github.com/turbot/steampipe-mod-cloudflare-sherlock/blob/main/docs/cloudflare_sherlock_session.png?raw=true)

## Current Sherlock Checks

TBD

## Quick start

1) Download and install Steampipe (https://steampipe.io/downloads). Or use Brew:

```shell
brew tap turbot/tap
brew install steampipe

steampipe -v
steampipe version 0.10.0
```

2) Install the Cloudflare plugin:
```shell
steampipe plugin install cloudflare
```

3) Configure your Cloudflare creds: [Instructions](https://hub.steampipe.io/plugins/turbot/cloudflare#connection-configuration)

`vi ~/.steampipe/config/cloudflare.spc`
```hcl
connection "cloudflare" {
  plugin  = "cloudflare"
  token   = "psth3GX0qHavRYE-hd5y7_iL7piII6C8jR3FOuW3"
}
```

4) Clone this repo and step into the directory:
```sh
git clone https://github.com/turbot/steampipe-mod-cloudflare-sherlock.git
cd steampipe-mod-cloudflare-sherlock
```

5) Run the checks:
```shell
steampipe check all
```

You can also run a specific controls by name:
```shell
steampipe check control.public_repo_code_of_conduct_added
```

Use introspection to view the available controls:
```
steampipe query "select resource_name from steampipe_control;"
```

## Contributing

Have an idea for additional checks or best practices?
- **[Join our Slack community →](https://steampipe.io/community/join)**
- **[Mod developer guide →](https://steampipe.io/docs/steampipe-mods/writing-mods.md)**

**Prerequisites**:
- [Steampipe installed](https://steampipe.io/downloads)
- Steampipe Cloudflare plugin installed (see above)

**Fork**:
Click on the Cloudflare Fork Widget. (Don't forget to :star: the repo!)

**Clone**:

1. Change the current working directory to the location where you want to put the cloned directory on your local filesystem.
2. Type the clone command below inserting your Cloudflare username instead of `YOUR-USERNAME`:

```sh
git clone git@github.com:YOUR-USERNAME/steampipe-mod-cloudflare-sherlock
cd steampipe-mod-cloudflare-sherlock
```

Thanks for getting involved! We would love to have you [join our Slack community](https://steampipe.io/community/join) and hang out with other Steampipe Mod developers.

Please see the [contribution guidelines](https://github.com/turbot/steampipe/blob/main/CONTRIBUTING.md) and our [code of conduct](https://github.com/turbot/steampipe/blob/main/CODE_OF_CONDUCT.md). All contributions are subject to the [Apache 2.0 open source license](https://github.com/turbot/steampipe-mod-aws-compliance/blob/main/LICENSE).

`help wanted` issues:
- [Steampipe](https://github.com/turbot/steampipe/labels/help%20wanted)
- [Cloudflare Sherlock Mod](https://github.com/turbot/steampipe-mod-cloudflare-sherlock/labels/help%20wanted)
