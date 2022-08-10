# Odoo 14 Devcontainer

This repo is a meta-repo that includes everything needed for Odoo 14 in a VScode devcontainer.

This is not secure - it's intended for development usage only!

## Features:

* Odoo 14 via [OCA's Backports repo](https://github.com/OCA/OCB/tree/14.0) as a git submodule
* Support for local addons in `addons/custom` directory.
* Support for third-party addons via git submodules (as below)
* PostgreSQL
* Odoo Filestore and PostgreSQL are volumes for some minor persistence.
* Scripted generation of `addons_path` in Odoo conf via `./regenerate-odoo-conf.sh`
* Demo data and no ssl by default (anti-features)

### Repo Layout

```
odoo-14-devcontainer/
├── addons
│   ├── addons_oca_server-brand   # addon sub-repository (https://github.com/OCA/server-brand/tree/14.0)
│   ├── addons_oca_web            # example of another addon sub-repository (https://github.com/OCA/web/tree/14.0)
│   └── custom                    # custom addon code lives here
└── server                        # could be a sub-repository of https://github.com/odoo/odoo but backports has been used instead https://github.com/OCA/OCB
```

## How to add new third-party addons

To add a new addon we need to track the git repo as a submodule:

```shell
$ git submodule add --branch 14.0 https://github.com/OCA/server-brand addons/addons_oca_server-brand
```

These will also need to be added to `odoo-dev.conf` if used, this can be done by using the `regenerate-odoo-conf.sh` command.

## How to update existing addons

```shell
$ git submodule update --remote
```

## Local Development

This is designed for usage in a VSCode devcontainer.

You might need:

```shell
pip3 install -r server/requirements.txt
./server/odoo-bin -i base --config odoo-dev.conf
```

This should forward port `8069` to your [localhost](http://localhost:8069).

## Why?

Or why not Odoo's official Docker image? I wanted something quick, easy and lightweight to add addons into via submodules. Unlike Odoo's Dockerfile production usage and edge-cases not required. I also wanted to be able to configure the Python version - this is a very basic set of additions to Microsoft's official Python DevContainer so python version can be configured. As such, it also supports both amd64 and arm64.
