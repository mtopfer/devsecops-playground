#!/usr/bin/env bash

# Prerequisites for running Sonarqube can be found here https://docs.sonarqube.org/7.9/requirements/requirements/
# To make this changes permanent edit and store the values inside /etc/sysctl.conf
 
echo "Configuring Sonarqube requirements (https://docs.sonarqube.org/7.9/requirements/requirements/)..."
sudo sysctl -w vm.max_map_count=262144
sudo sysctl -w fs.file-max=65536

echo "Starting docker-compose..."
docker-compose up -d

