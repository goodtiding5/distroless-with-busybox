#!/bin/sh

BUSYBOX_REL="1.30.0"		# busybox release number
BUSYBOX_PLT="i686"		# busybox release platform

[ -d bin ] && rm -rf bin
mkdir bin
cd bin
curl -O https://busybox.net/downloads/binaries/"$BUSYBOX_REL-$BUSYBOX_PLT"/busybox
if [ -f busybox ]; then
    chmod 0555 busybox;
    for f in $(./busybox --list); do ln -f busybox $f; done
fi
