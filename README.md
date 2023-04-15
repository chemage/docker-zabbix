# docker-zabbix
Running Docker containers for Zabbix.

## Main components
- zabbix-server-mysql
- zabbix-web-apache-mysql
- zabbix-agent2
- zabbix-snmptraps
- MariaDB on host

## Additional components
- zabbix-proxy

## Configurations

### MariaDB

#### User configuration

For separate host, the users (root and zabbix) must be created as follows.
This will allow the components to connect to MariaDB from different sources.
Best would be to restrict source a little, but then, networking needs to be specified for containers.

```
CREATE USER zabbix@'172.48.16.0/255.255.255.0' IDENTIFIED BY 'pwd';
CREATE USER root4zabbix@'172.48.16.0/255.255.255.0' IDENTIFIED BY 'pwd';
GRANT ALL ON zabbix.* TO zabbix@'172.48.16.0/255.255.255.0';
GRANT ALL ON *.* TO root4zabbix@'172.48.16.0/255.255.255.0';
FLUSH PRIVILEGES;
SELECT Host, User FROM mysql.user;
```

### Web Server
|Name|Host Port|Image Port|
|----|---------|----------|
|Zabbix HTTP|8881|8080|
|Zabbix HTTPS|8882|8443|
|PhpMyAdmin HTTP|8883|80|

## Troubleshoot Issues

### Run Docker Compose in Interactive Mode

Run docker compose without -d, so you can see the output.
```
sudo docker compose -f docker-compose_raspbian_hostdb_latest.yml up
```

Connect to docker container and try connecting to MariaDB.
```
sudo docker container exec -it <containerId> sh
mysql -h 172.16.16.105 -u root4zabbix -p
```
