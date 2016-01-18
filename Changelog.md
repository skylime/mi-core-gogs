# Changelog

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
