#!/bin/bash
IMAGE_NAME=kalaiaadhav/dev:tag11

# Build the Docker image
docker build -t $IMAGE_NAME .
