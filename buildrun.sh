#!/bin/bash

clear
REPOSITORY=$1
VERSION=$2

if [ -z "$REPOSITORY" ]
then
    REPOSITORY=dtdemos
fi

if [ -z "$VERSION" ]
then
    VERSION=1
fi

IMAGE=dt-orders-catalog-service
FULLIMAGE=$REPOSITORY/$IMAGE:$VERSION

echo "Building: $FULLIMAGE"
./mvnw clean package -Dmaven.test.skip=true
./writeManifest.sh

docker build -t $FULLIMAGE . --build-arg APP_VERSION=$VERSION

echo ""
echo "========================================================"
echo "Ready to run $FULLIMAGE ?"
echo "========================================================"

read -rsp "Press ctrl-c to abort. Press any key to continue"
echo ""
echo "access app @ http://localhost"
echo "" 
docker run -it -p 8080:8080 \
  $FULLIMAGE 
