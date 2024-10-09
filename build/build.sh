#!/bin/bash

IMAGE_NAME="myapp_17"
TAG="latest4"
echo "AAdhav12@01" | docker login -u kalaiaadhav --password-stdin
DEV_REPO="kalaiaadhav/dev"
# Build the Docker image
sudo docker build -t $IMAGE_NAME:$TAG .
# Tag the image for the dev repository
sudo docker tag $IMAGE_NAME:$TAG $DEV_REPO:$TAG

# Push the image to the dev repository
sudo docker push $DEV_REPO:$TAG
