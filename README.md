Please switch to [Forgejo](https://github.com/skylime/mi-core-forgejo). Our Gogs image is discontinued and will not receive any updates.

# mi-core-gogs

This repository is based on [Joyent mibe](https://github.com/joyent/mibe). Please note this repository should be build with the [mi-core-base](https://github.com/skylime/mi-core-base) mibe image.

## description

Minimal mibe image for [Gogs - Go Git Service](http://gogs.io). It's required to
finish the installation via web interface and follow the steps of the
installer.

### build gogs for the mibe image

Please notice this documentation is a minimal copy of the original documentation from [How to build gogs from source](http://gogs.io/docs/installation/install_from_source).

Install go and build requirements first:

	pkgin install go build-essential git zip nodejs npm zip
	npm install -g less

Create a go working directory:

	mkdir ~/go
	export GOPATH=${HOME}/go

Get and build gogs binary:

	git clone --depth 1 https://github.com/gogs/gogs.git gogs
	cd gogs

Use the official `Makefile` to create an release:

	make release TAGS="sqlite redis memcache pam cert"

You find an `release/gogs.${NOW}.zip` file now. But sadly this fill does not
contains all required information. So we should generate our own release as
`tar.gz` file:

	cd release/gogs && \
		cp -r ../../templates . &&
		cp -r ../../public . 
	
	cd release && \
		VERSION=$(sed -n 's/.*conf.App.Version = "\(.*\)+.*"/\1-'$(git rev-parse --short HEAD)'/p' ../gogs.go)
		tar cfz gogs-${VERSION}.tar.gz gogs

## mdata variables

No mdata variable is required.

## services

- `22/tcp`: ssh connections
- `80/tcp`: http webserver
- `443/tcp`: https webserver
