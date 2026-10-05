
###

```
a. Install nginx on app server 1 , configure it to use port 8091 and its document root should be /var/www/html.
b. Install php-fpm version 8.2 on app server 1, it must use the unix socket /var/run/php-fpm/default.sock (create the parent directories if don't exist).
c. Configure php-fpm and nginx to work together.
d. Once configured correctly, you can test the website using curl http://stapp01:8091/index.php command from jump host.
```

```
sudo dnf update -y
sudo dnf install nginx -y
sudo dnf module install php:8.1 -y



sudo yum install nginx -y
sudo vi /etc/nginx/nginx.conf
sudo systemctl enable --now nginx

sudo dnf install -y https://rpms.remirepo.net/enterprise/remi-release-9.rpm
sudo dnf module reset php -y
sudo dnf module enable php:remi-8.2 -y
sudo dnf install -y php-fpm

sudo systemctl enable php-fpm

 24  sudo vi /etc/php-fpm.d/www.conf
   25  sudo mkdir -p /var/run/php-fpm
   26  sudo php-fpm -t
   27  sudo systemctl restart php-fpm
   28  sudo ls -l /var/run/php-fpm/default.sock
   29  sudo find /var/run/php-fpm -type s
   30  cat /etc/php-fpm.d/www.conf | grep "listen.acl_users"
   31  curl http://stapp01:8091/index.php
```