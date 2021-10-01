#!/bin/sh

set -e

AWTRIX_BETA=${AWTRIX_BETA:-false}
AUTOUPDATE=${AUTOUPDATE:-true}
WGET_ALPINE_UPDATE=${WGET_ALPINE_UPDATE:-true}

if [ "$AUTOUPDATE" = true ] ; then
    if [ "$AWTRIX_BETA" = true ] ; then
        AWTRIX_DL_URL=https://blueforcer.de/awtrix/beta/awtrix.jar
    elif  [ "$AWTRIX_BETA" = "nightly" ] ; then
        AWTRIX_DL_URL=https://blueforcer.de/awtrix/nightly/awtrix.jar
    else    
        AWTRIX_DL_URL=https://blueforcer.de/awtrix/stable/awtrix.jar      
    fi
    
if [ "$WGET_ALPINE_UPDATE" = true ] ; then
apk update
apk add wget
WGET_ALPINE_UPDATE = false
fi

wget $AWTRIX_DL_URL -O /data/awtrix.jar
fi

java -jar /data/awtrix.jar
