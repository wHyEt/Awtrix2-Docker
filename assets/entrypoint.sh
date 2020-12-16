#!/bin/sh

set -e

AWTRIX_BETA=${AWTRIX_BETA:-false}

if [ "$AWTRIX_BETA" = true ] ; then
    AWTRIX_DL_URL=https://blueforcer.de/awtrix/beta/awtrix.jar
else
    AWTRIX_DL_URL=https://blueforcer.de/awtrix/stable/awtrix.jar
fi

wget $AWTRIX_DL_URL -O /data/awtrix.jar

java -jar /data/awtrix.jar