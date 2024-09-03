#!/bin/bash
# Set variables
IMAGE_NAME="myapp3"
TAG="latest"
echo "AAdhav12@01" | docker login -u kalaiaadhav --password-stdin
DEV_REPO="kalaiaadhav/dev"
SERVER_USER="ubuntu"
SERVER_IP="ec2-54-211-120-246.compute-1.amazonaws.com"



# Pull the latest image from the production repository
ssh $SERVER_USER@$SERVER_IP "docker pull $DEV_REPO:$TAG"

# Stop and remove the existing container if it exists
ssh $SERVER_USER@$SERVER_IP "docker stop $IMAGE_NAME || true"
ssh $SERVER_USER@$SERVER_IP "docker rm $IMAGE_NAME || true"

# Run the new container
ssh $SERVER_USER@$SERVER_IP "docker run -d --name $IMAGE_NAME -p 80:80 $DEV_REPO:$TAG"
