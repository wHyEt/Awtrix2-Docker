# Awtrix2-Docker
Official Docker Container for [Awtrix2](https://blueforcer.de/2019/01/04/awtrix-2-0/) Host in collaboration with Blueforcer.

The Container is based on the anapsix/alpine-java:8_JDK image.

It has an autoupdate feature witch will get the latest Host from the Awtrix Site on a restart from the Container.

Thx to foorschtbar its now MultiPlatform

# Beta Version

if you want to use the beta version set:

```shell
-e AWTRIX_BETA=true -e AUTOUPDATE=true
```

# AUTOUPDATE

You can Disable autoupdate bei setting:

```shell
-e AUTOUPDATE=false 
```

# Getting Started

```shell
docker run --name AwTriX2 -p 7000:7000 -p 7001:7001 -p 5568:5568/udp --restart always -e TZ=Europe/Berlin  whyet/awtrix2:latest 
```

# Docker Compose

Please don't forget to add your host interface in volumes:

```shell
version: "3"

services:
  awtrix:
    image: whyet/awtrix2
    restart: unless-stopped
    ports:
      - "7000:7000"
      - "7001:7001"
      - "5568:5568"
   
    volumes:
      - ./data:/data
      - /sys/class/net/<your interface>/address:/data/hostmac
    environment:
      - TZ=Europe/Berlin
      - JAVA_TOOL_OPTIONS="-Duser.language=de -Duser.country=DE"
      - AWTRIX_BETA=false
      - AUTOUPDATE=true
```

# Additional Ports:

-p 80:80  For Amazon Alexa Support you need this Port. If This Port is already used this can be changed in the config file. 

# For persistent Data add:

```shell
-v pwd:/data
```

# Set Language

If you want AWTRIX to automatically display some apps like **DayOfTheWeek** in your local language/format (e.g. "Sonntag" instead of "Sunday") you can specify this with an eviroment variable.

```shell
-e JAVA_TOOL_OPTIONS="-Duser.language=de -Duser.country=DE"
```

Where `de` is your two-letter language code. (see [ISO 639-2](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes))  
And `DE` is your two-letter country code. (see [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2))

# Awtrix Premium Users

If you want to use Premium please mount the host interface address to the container with: (works only with beta Version for Stable change to host mode like below)
 
```shell
-v /sys/class/net/<your interface>/address:/data/hostmac
```

or run the container in host mode:

```shell
--network host
```

# WGET Certifcate Error

If you run in this issue the only two solutions at the moment are on existing containers deactivate Autoupdate.
Or on certain platforms you can set the the following ENVs:

```shell
-e WGET_ALPINE_UPDATE = true 
-e AUTOUPDATE = true
```

# Support for Creating Docker Containers ;)

<a href="https://www.buymeacoffee.com/TechNic" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" style="height: 13px !important;width: 55px !important;" ></a>
