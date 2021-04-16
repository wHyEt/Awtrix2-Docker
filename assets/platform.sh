
#!/bin/bash -x
if [ $1 == "linux/arm64" ];
then echo "arm64"
apk --no-cache add wget
else echo "Platform is: $1"
fi


