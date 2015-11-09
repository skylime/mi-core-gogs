# mi-core-kumquat

This repository is based on [Joyent mibe](https://github.com/joyent/mibe). Please note this repository should be build with the [mi-core-base](https://github.com/skylime/mi-core-base) mibe image.

## description

Minimal mibe image for [Gogs - Go Git Service](http://gogs.io). It contains some workarounds because at the moment the image contains the binary of `gogs`.

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
	go build -tags "sqlite redis pam cert"

Copy required files into the mibe image to be deployed:

	export DEST="mi-core-gogs/copy/opt/gogs/"
	mkdir -p ${DEST}
	cp -a ${GOPATH}/src/github.com/gogits/gogs/{gogs,conf,public,templates} ${DEST}

## mdata variables

No mdata variable is required.

## services

- `22/tcp`: ssh connections
- `80/tcp`: http webserver
- `443/tcp`: https webserver
