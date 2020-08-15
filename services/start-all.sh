#!/usr/bin/env bash

declare -a ServicesToStart=( "jenkins" "arachni" "clair" "defect-dojo" "sonarqube" )

dc_up () {
  echo -e "\nStarting service $1..."
  cd $1
  if [ -x start.sh ] ; then
    ./start.sh
  else
   docker-compose up -d
  fi
  cd ..
}

for s in ${ServicesToStart[@]}; do
   dc_up $s
done

echo -e "\nSleep 2 seconds for all resources to be created..."
sleep 2

echo -e "\nList nework subnets:"

docker network ls -q |
while read -r line
do
  docker inspect "$line" --format '{{.Name}} {{range .IPAM.Config}}{{.Gateway}}{{end}}' | grep -vi 'none\|host'
done

echo -e "\nList all the running containers:"
docker ps