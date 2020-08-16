#!/usr/bin/env bash

echo "Initial Jenkins access password:"
docker exec -it jenkins-manager cat /var/jenkins_home/secrets/initialAdminPassword
