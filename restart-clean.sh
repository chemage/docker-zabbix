#!/bin/sh
# Stop containers, remove them and start afresh
# give docker-compose file as param

if [ -z "$1" ]
then
  echo "Error: missing yaml file as parameter. Exiting."
  exit
fi

echo "Using docker-compose file '$1'."
docker-compose -f $1 stop
docker-compose -f $1 rm
docker network rm zabbixnet
docker network rm backend
rm -rf ./data
ls -lAh --color
docker-compose -f $1 up -d
docker ps
