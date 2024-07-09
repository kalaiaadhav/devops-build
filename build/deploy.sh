#!/bin/bash




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
ssh -i "newkey01.pem" ubuntu@ec2-52-207-225-229.compute-1.amazonaws.com "docker pull $IMAGE_NAME && docker stop <container_name> && docker rm <container_name> && docker run -d --name <container_name> $IMAGE_NAME"

#echo "Image deployed to $1 environment."
