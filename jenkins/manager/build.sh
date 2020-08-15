#!/usr/bin/env bash
# 'docker build' for Manager is not required if started with docker-compose

# Version will include Year and Week number (example: 20.32)
version=$(date +"%y.%W")

echo -e "Building version ${version}\n"
docker build . -t jenkins-manager:latest -t jenkins-manager:$version