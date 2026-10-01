###

```
a. Install/Configure MariaDB server.
b. Create a database named kodekloud_db9.
c. Create a user called kodekloud_pop and set its password to 8FmzjvFU6S.
d. Grant full permissions to user kodekloud_pop on database kodekloud_db9.
```

```
sudo dnf install -y mariadb-server
sudo systemctl enable --now mariadb
sudo systemctl status mariadb

sudo mysql
CREATE DATABASE kodekloud_db1;
CREATE USER 'kodekloud_pop'@'localhost' IDENTIFIED BY 'dCV3szSGNA';
GRANT ALL PRIVILEGES ON kodekloud_db1.* TO 'kodekloud_pop'@'localhost';
FLUSH PRIVILEGES;
EXIT;

mysql -u kodekloud_pop -p
SHOW DATABASES;

```