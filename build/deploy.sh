#!/bin/bash

# Set variables
IMAGE_NAME="myapp_13"
TAG="latest"
echo "AAdhav12@01" | docker login -u kalaiaadhav --password-stdin
DEV_REPO="kalaiaadhav/dev"
PROD_REPO="kalaiaadhav/prod"

# Pull the latest image from the production repository
#docker pull $DEV_REPO:$TAG

# Stop and remove the existing container if it exists
 #docker stop $IMAGE_NAME || true
 #docker rm $IMAGE_NAME || true

# Run the new container
#docker run -d --name $IMAGE_NAME -p 80:80 $DEV_REPO:$TAG

ssh -i "C:\Users\Admin\Downloads\newkey01.pem" ubuntu@ec2-44-211-68-140.compute-1.amazonaws.com "docker pull $IMAGE_NAME && docker stop $IMAGE_NAME && docker rm $IMAGE_NAME && docker run -d --name $IMAGE_NAME -p 80:80 $DEV_REPO:$TAG
"
