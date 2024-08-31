#!/bin/bash

# Set variables
IMAGE_NAME="myapp"
TAG="latest"
PROD_REPO="kalaiaadhav/prod"
SERVER_USER="ubuntu"
SERVER_IP="server-ip"

# Pull the latest image from the production repository
ssh $SERVER_USER@$SERVER_IP "docker pull $PROD_REPO:$TAG"

# Stop and remove the existing container if it exists
ssh $SERVER_USER@$SERVER_IP "docker stop $IMAGE_NAME || true"
ssh $SERVER_USER@$SERVER_IP "docker rm $IMAGE_NAME || true"

# Run the new container
ssh $SERVER_USER@$SERVER_IP "docker run -d --name $IMAGE_NAME -p 80:80 $PROD_REPO:$TAG"

