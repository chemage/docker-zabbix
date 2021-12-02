#!/bin/sh
# Stop containers, remove them and start afresh
# give docker-compose file as param
docker-compose -f $1 stop
docker-compose -f $1 rm
docker network rm zabbixnet
rm -rf zabbix* mysql
ls -lAh --color
docker-compose -f $1 up -d
