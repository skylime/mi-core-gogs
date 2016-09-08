# mi-core-kumquat

This repository is based on [Joyent mibe](https://github.com/joyent/mibe). Please note this repository should be build with the [mi-core-base](https://github.com/skylime/mi-core-base) mibe image.

## description

Minimal mibe image for [Gogs - Go Git Service](http://gogs.io). It's required to
finish the installation via web interface and follow the steps of the
installer.

### build gogs for the mibe image

Please notice this documentation is a minimal copy of the original documentation from [How to build gogs from source](http://gogs.io/docs/installation/install_from_source).

Install go first:

	pkgin install go

Create a go working directory:

	mkdir ~/go
	export GOPATH=${HOME}/go

Get and build gogs binary:

	go get -u -tags "sqlite tidb redis memcache pam cert" github.com/gogits/gogs
	cd ${GOPATH}/src/github.com/gogits/gogs

Maybe you need to fix the `LDFLAGS` on SmartOS because of the stack smashing
protector if you use sqlite:

	LDFLAGS += -extldflags "-lssp" ...

Use the official `Makefile` to create an release:

	make release TAGS="sqlite redis memcache pam cert"

You find an `release/gogs.${NOW}.zip` file now. Because it's much more awesome
to use a `tar.gz` file I also build an additional file:

	cd release && \
		tar cfz $(ls *.zip | sed 's:.zip::g' | tail -n1).tar.gz gogs

## mdata variables

No mdata variable is required.

## services

- `22/tcp`: ssh connections
- `80/tcp`: http webserver
- `443/tcp`: https webserver
