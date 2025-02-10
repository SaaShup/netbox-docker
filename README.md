# Netbox Docker Distribution

Netbox distribution with useful plugins inside.

## Netbox Distribution why?

Because we need Netbox instances that fit with our activities at Saashup :-)

## What is the content?

* [Netbox](https://github.com/netbox-community/netbox) with preinstalled
  plugins:
    - [Netbox Cloudflare Plugin](https://github.com/SaaShup/netbox-cloudflare-plugin)
    - [Netbox Docker Plugin](https://github.com/SaaShup/netbox-docker-plugin)

## Give it a try!

On your favorite terminal (that we know the best terminal is
[iTerm](https://iterm2.com/)) clone this repository and type:

```bash
env TAG=latest IMAGE=saashup/netbox-docker docker compose up -d
```

# Hosting
Check https://saashup.com for more information.
