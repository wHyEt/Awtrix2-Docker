FROM    anapsix/alpine-java:8_jdk

# Output target platform
ARG TARGETPLATFORM
RUN echo "Building for ARCH $TARGETPLATFORM"

WORKDIR /data
EXPOSE 7000 7001

# Set entrypoint
COPY ./assets/entrypoint.sh /entrypoint.sh
RUN wget https://blueforcer.de/awtrix/stable/awtrix.jar -O /data/awtrix.jar
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]