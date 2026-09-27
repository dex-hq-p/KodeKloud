###

```
1. Install and configure nginx on App Server 1.


2. On App Server 1 there is a self signed SSL certificate and key present at location /tmp/nautilus.crt and /tmp/nautilus.key. Move them to some appropriate location and deploy the same in Nginx.


3. Create an index.html file with content Welcome! under Nginx document root.


4. For final testing try to access the App Server 1 link (via hostname) from jump host using curl command. For example: curl -Ik https://<app-server-name>/.
```

```

    1  sudo yum install nginx -y
    2  mkdi /etc/nginx/ssl
    3  mkdir /etc/nginx/ssl
    4  sudo mv /tmp/nautilus.crt /etc/nginx/ssl/
    5  sudo mv /tmp/nautilus.key /etc/nginx/ssl/
    6  sudo chmod 600 /etc/nginx/ssl/nautilus.key
    7  cd /usr/share/nginx/html
    8  echo "Welcome!" | sudo tee /usr/share/nginx/html/index.html
    9  sudo vi /etc/nginx/conf.d/ssl.conf

server {
    listen 443 ssl;
    server_name _;

    ssl_certificate /etc/nginx/ssl/nautilus.crt;
    ssl_certificate_key /etc/nginx/ssl/nautilus.key;

    root /usr/share/nginx/html;
    index index.html;
}

   10  sudo nginx -t
   11  sudo systemctl enable --now nginx
   12  sudo systemctl restart nginx




curl -Ik https://stapp03/
```