
#!/bin/bash -x
if [ $1 == "linux/arm64" ];
then echo "arm64"
apk add --no-cache wget
else echo "Platform is: $1"
fi


