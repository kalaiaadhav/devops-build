#!/bin/bash

# Set variables
IMAGE_NAME="myapp_11"
TAG="latest"
echo "AAdhav12@01" | docker login -u kalaiaadhav --password-stdin
DEV_REPO="kalaiaadhav/dev"
PROD_REPO="kalaiaadhav/prod"
SERVER_USER="ubuntu"
SERVER_IP="ec2-18-234-208-243.compute-1.amazonaws.com"

# Pull the latest image from the production repository
ssh -i "C:\Users\Admin\Downloads\newkey01.pem" $SERVER_USER@$SERVER_IP "docker pull $DEV_REPO:$TAG"

# Stop and remove the existing container if it exists
ssh -i "C:\Users\Admin\Downloads\newkey01.pem" $SERVER_USER@$SERVER_IP "docker stop $IMAGE_NAME || true"
ssh -i "C:\Users\Admin\Downloads\newkey01.pem" $SERVER_USER@$SERVER_IP "docker rm $IMAGE_NAME || true"

# Run the new container
ssh -i "C:\Users\Admin\Downloads\newkey01.pem" $SERVER_USER@$SERVER_IP "docker run -d --name $IMAGE_NAME -p 80:80 $DEV_REPO:$TAG"

