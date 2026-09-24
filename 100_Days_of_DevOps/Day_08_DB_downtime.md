###

```
There is a critical issue going on with the Nautilus application in Stratos DC. The production support team identified that the application is unable to connect to the database. After digging into the issue, the team found that mariadb service is down on the database server.
```

```
systemctl status mariadb
journalctl -xeu mariadb.service

tail -100 /var/log/mariadb/mariadb.log 

[root@stdb01 peter]# ls -ld /run/mariadb
drwxr-xr-x 2 root mysql 40 Sep 21 12:44 /run/mariadb
[root@stdb01 peter]# chown mysql:mysql /run/mariadb

```