FROM    anapsix/alpine-java:8_jdk
RUN mkdir -p /containerdata/
RUN touch /containerdata/docker-entrypoint.sh
RUN echo "#!/bin/bash" > /containerdata/docker-entrypoint.sh
RUN echo "wget https://blueforcer.de/awtrix/stable/awtrix.jar -O /data/awtrix.jar" >> /containerdata/docker-entrypoint.sh
RUN echo "java -jar /data/awtrix.jar" >> /containerdata/docker-entrypoint.sh
RUN ["chmod", "+x", "/containerdata/docker-entrypoint.sh"]
VOLUME ["/containerdata"]
WORKDIR /data
EXPOSE 7000 7001
ENTRYPOINT ["/containerdata/docker-entrypoint.sh"]
