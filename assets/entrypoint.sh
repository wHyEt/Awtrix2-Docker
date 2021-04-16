#!/bin/sh

set -e

AWTRIX_BETA=${AWTRIX_BETA:-false}
AUTOUPDATE=${AUTOUPDATE:-true}

if [ "$TARGETPLATFORM" = "linux/arm64" ] ; then 
apk --no-cache add wget
fi


if [ "$AUTOUPDATE" = true ] ; then
    if [ "$AWTRIX_BETA" = true ] ; then
        AWTRIX_DL_URL=https://blueforcer.de/awtrix/beta/awtrix.jar
    elif  [ "$AWTRIX_BETA" = "nightly" ] ; then
        AWTRIX_DL_URL=https://blueforcer.de/awtrix/nightly/awtrix.jar
    else    
        AWTRIX_DL_URL=https://blueforcer.de/awtrix/stable/awtrix.jar      
    fi

wget $AWTRIX_DL_URL -O /data/awtrix.jar
fi

java -jar /data/awtrix.jar
