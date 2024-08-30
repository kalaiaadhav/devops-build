#!/bin/bash
# Replace with your credentials and server details
USERNAME=kalaiaadhav
PASSWORD=AAdhav12@01
SERVER_IP=54.89.224.226

# Login to Docker Hub (assuming pushing to Docker Hub)
docker login -u $USERNAME -p $PASSWORD

# Tag the image for the appropriate environment (dev or prod)
if [ "$1" == "dev" ]; then
  IMAGE_NAME=$IMAGE_NAME:dev
elif [ "$1" == "prod" ]; then
  IMAGE_NAME=$IMAGE_NAME:latest
else
  echo "Invalid environment argument. Please specify 'dev' or 'prod'."
  exit 1
fi

# Push the image to Docker Hub
docker push $IMAGE_NAME

# Deploy the image to the server (replace with your specific deployment command)
ssh -i "newkey01.pem" ubuntu@ec2-54-89-224-226.compute-1.amazonaws.com"docker pull $IMAGE_NAME && docker stop <container_name> && docker rm <container_name> && docker run -d --name <container_name> $IMAGE_NAME"

echo "Image deployed to $1 environment."
