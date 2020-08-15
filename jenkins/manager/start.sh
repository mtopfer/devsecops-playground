#!/usr/bin/env bash

export COMPOSE_CONVERT_WINDOWS_PATHS=1

echo -e "\nStarting docker-compose..."
docker-compose up -d

echo -e "\nSleeping for 10 seconds..."
sleep 10

echo -e "\nDumping logs..."
docker-compose logs

echo -e "\nTo tail the logs use 'docker-compose logs -f'"

echo -e "\nDone."