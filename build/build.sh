#!/bin/bash
IMAGE_NAME=kalaiaadhav/dev:tag10

# Build the Docker image
docker build -t $IMAGE_NAME .
