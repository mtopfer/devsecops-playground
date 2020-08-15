#!/usr/bin/env bash

declare -a ServicesToStop=( "jenkins" "arachni" "clair" "defect-dojo" "sonarqube" )

dc_down () {
  echo -e "\nStopping service $1..."
  cd $1
  if [ -x stop.sh ] ; then
    ./stop.sh
  else
   docker-compose down
  fi
  cd ..
}

for s in ${ServicesToStop[@]}; do
   dc_down $s
done

echo -e "\nList all the running containers:"
docker ps