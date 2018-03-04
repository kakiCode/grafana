#!/bin/sh

NAME=grafana
IMAGE=$NAME
DOCKER_HUB_IMG=caquicode/$NAME
SOURCE_IMAGE=grafana/grafana


echo "going to use a third party image\n...pulling it "
docker pull $SOURCE_IMAGE
echo "going to push image $IMAGE to docker hub..."
docker tag $SOURCE_IMAGE $DOCKER_HUB_IMG
docker push $DOCKER_HUB_IMG

echo "... done."




