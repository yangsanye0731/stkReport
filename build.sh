#!/bin/sh

DOCKER_TAG=317491841/stkreport:latest

echo " docker build -f Dockerfile -t ${DOCKER_TAG} ."
docker build -f Dockerfile -t ${DOCKER_TAG} .
echo "#################################################################"
echo " docker push ${DOCKER_TAG} "
#docker push ${DOCKER_TAG}
