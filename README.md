# Awtrix2-Docker
Official Docker Container for Awtrix2 Server in collaboration with Blueforcer.

The Container is based on the anapsix/alpine-java:8_JDK image.

It has an autoupdate feature witch will get the latest Server from the Awtrix Site on a restart from the Container.

# Getting Started

sudo docker run --name AwTriX2 -p 7000:7000 -p 7001:7001 --restart always -e TZ=Europe/Berlin whyet/awtrix2:latest-arm

# For persistent Data add:

-v pwd:/data
