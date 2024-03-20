# mi-core-forgejo

This repository is based on [Joyent mibe](https://github.com/joyent/mibe). Please note this repository should be build with the [mi-core-base](https://github.com/skylime/mi-core-base) mibe image.

## description

Minimal mibe image for [Forgejo](https://forgejo.org). It's required to
finish the installation via web interface and follow the steps of the
installer.

## mdata variables

No mdata variable is required.

## services

- `22/tcp`: ssh connections
- `80/tcp`: http webserver
- `443/tcp`: https webserver
