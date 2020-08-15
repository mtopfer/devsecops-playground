#!/usr/bin/env bash

echo "Initial Jenkins access password:"
docker exec -it jenkins-master cat /var/jenkins_home/secrets/initialAdminPassword
