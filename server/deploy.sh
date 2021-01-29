#!/bin/bash

echo What should the version be?
read VERSION

docker build -t sunnydhama/contentspose:$VERSION .
docker push sunnydhama/contentspose:$VERSION
ssh root@64.227.13.208 "docker pull sunnydhama/contentspose:$VERSION && docker tag sunnydhama/contentspose:$VERSION dokku/api:$VERSION && dokku deploy api $VERSION"