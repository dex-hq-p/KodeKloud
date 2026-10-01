###

```
PostgreSQL database server is already installed on the Nautilus database server.

a. Create a database user kodekloud_aim and set its password to BruCStnMT5.

b. Create a database kodekloud_db10 and grant full permissions to user kodekloud_aim on this database.
```

```
sudo -u postgres psql
CREATE USER kodekloud_aim WITH PASSWORD 'BruCStnMT5';
CREATE DATABASE kodekloud_db10;
GRANT ALL PRIVILEGES ON DATABASE kodekloud_db10 TO kodekloud_aim;

```