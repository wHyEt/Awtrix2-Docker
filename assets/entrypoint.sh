#!/bin/sh

set -e

AWTRIX_BETA=${AWTRIX_BETA:-false}
AUTOUPDATE=${AUTOUPDATE:-true}


if [ "$AUTOUPDATE" = true ] ; then
    if [ "$AWTRIX_BETA" = true ] ; then
        AWTRIX_DL_URL=https://blueforcer.de/awtrix/beta/awtrix.jar
    elif  [ "$AWTRIX_BETA" = "nightly" ] ; then
        AWTRIX_DL_URL=https://blueforcer.de/awtrix/nightly/awtrix.jar
    else    
        AWTRIX_DL_URL=https://blueforcer.de/awtrix/stable/awtrix.jar      
    fi
echo $TARGETPLATFORM
wget $AWTRIX_DL_URL -O /data/awtrix.jar
fi

java -jar /data/awtrix.jar
