# docker-zabbix
Running Docker containers for Zabbix.

## Main components
- zabbix-server-mysql
- zabbix-web-apache-mysql
- zabbix-agent2
- zabbix-snmptraps

## Additional components
- zabbix-proxy

## Configurations

### Web Server
|Name|Host Port|Image Port|
|----|---------|----------|
|Zabbix HTTP|8881|80|
|Zabbix HTTPS|8882|443|
|PhpMyAdmin HTTP|8883|80|

