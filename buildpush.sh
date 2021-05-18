#!/bin/bash

clear
REPOSITORY=$1
if [ -z "$REPOSITORY" ]
then
    REPOSITORY=dtdemos
fi

IMAGE=$REPOSITORY/dt-orders-catalog-service

#./mvnw clean package
./mvnw clean package -Dmaven.test.skip=true
./writeManifest.sh

docker build -t $IMAGE:1 . --build-arg APP_VERSION=1
docker tag $IMAGE:1 $IMAGE:1.0.0

echo ""
echo "========================================================"
echo "Ready to push images ?"
echo "========================================================"
read -rsp "Press ctrl-c to abort. Press any key to continue"

echo "Pushing $IMAGE:1"
docker push $IMAGE:1
docker push $IMAGE:1.0.0