#!/bin/bash
# Set variables
IMAGE_NAME="myapp3"
TAG="latest"
echo "AAdhav12@01" | docker login -u kalaiaadhav --password-stdin
DEV_REPO="kalaiaadhav/dev"
# Build the Docker image
docker build -t $IMAGE_NAME:$TAG .
# Tag the image for the dev repository
docker tag $IMAGE_NAME:$TAG $DEV_REPO:$TAG

# Push the image to the dev repository
docker push $DEV_REPO:$TAG

