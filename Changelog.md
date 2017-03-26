# Changelog

## 16.4.0

### New

* Update Gogs and core-base version. [Thomas Merkel]
* Let&#x27;s Encrypt support for Gogs / Nginx service. [Thomas Merkel]

### Other

* License update. [Thomas Merkel]
* Switch to Gogs version 0.10.x. [Thomas Merkel]

  Switch to a new build process and switch to a new release location which supports https for downloading the package.

* Update readme to build gogs. [Thomas Merkel]

## 16.3.0

### New

* Update to the newest gogs version v0.9.113 and core-base image. [Thomas
  Merkel]

### Fix

* Remove Redis because we don&#x27;t use it in our mibe image. [Thomas Merkel]
* Fix readme for ssp. [Thomas Merkel]

## 16.2.0

### New

* Version Bump to newest Gogs version 20160908021429. [Thomas Merkel]

	Base image update to core-base 16.2.0, fixing hostname issue if you
	don&#x27;t setup a hostname for the zone. Work without delegate dataset as
	well.

## 15.3.1

### Fix

* Fix permissions for GOGS home and also deploy config for default env. [Thomas Merkel]
* Unlock user and modify default shell to bash. [Thomas Merkel]

## 15.3.0

### Changes

* Enable gogs services. [Thomas Merkel]
* Update to new gogs release, add license and fix issue for nginx ssl. [Thomas Merkel]
* Merge branch &#x27;XakRu-patch-2&#x27; [Thomas Merkel]
* Merge branch &#x27;patch-2&#x27; of https://github.com/XakRu/mi-core-gogs into XakRu-patch-2. [Thomas Merkel]
* Don&#x27;t deliver gogs via git, use an existing build for SmartOS. [Thomas Merkel]

### New

* Add fallback manifest. [Thomas Merkel]
* Add manifest.json, fix customize script and add backup packages. [Thomas Merkel]
* Add delegate dataset script and nginx start script. [Thomas Merkel]
* Add default / minimal nginx config for gogs. [Thomas Merkel]
* Add SMF script to start gogs on SmartOS. [Thomas Merkel]
* Add motd. [Thomas Merkel]
* Add minimal readme (copied from other repository) [Thomas Merkel]
* Add gogs binary and configuration. [Thomas Merkel]

  This is an ugly workaround as long as no gogs pkgsrc package exists.

* Minimal customize script and packages which are required. [Thomas Merkel]
