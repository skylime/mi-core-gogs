#!/bin/bash

if DDS=$(/opt/core/bin/dds); then
	zfs create ${DDS}/forgejo-db || true
	zfs create ${DDS}/forgejo-conf || true
	zfs set mountpoint=/var/db/forgejo ${DDS}/forgejo-db
	zfs set mountpoint=/opt/local/etc/forgejo/conf ${DDS}/forgejo-conf

	# znapzend for backup
	znapzendzetup create --recursive --tsformat='%Y-%m-%d-%H%M%S' --donotask \
		SRC '7day=>8hour,30day=>1day,1year=>1week,10year=>1month' ${DDS}
	/usr/sbin/svcadm enable svc:/pkgsrc/znapzend:default
else
	# Everything will be created by the package automatically
	true
fi

# update permissions for git usage
chown git:git \
	/var/db/forgejo \
	/opt/local/etc/forgejo
