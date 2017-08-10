#!/bin/sh

devops_folder=$(dirname $(readlink -f $0))
base_folder=$(dirname $devops_folder)

. $devops_folder/VARS.sh

docker stop $CONTAINER
docker rm $CONTAINER
docker pull $IMAGE
ENV="-e GF_SECURITY_ADMIN_PASSWORD=password -e GF_SECURITY_ADMIN_USER=root"
docker run -d -h $HOST --name $CONTAINER --link $DB_CONTAINER:$DB_CONTAINER -p $PORT:$PORT $ENV $IMAGE
#docker logs -f $CONTAINER
