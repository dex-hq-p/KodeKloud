###

```
xFusionCorp Industries is planning to host two static websites on their infra in Stratos Datacenter. The development of these websites is still in-progress, but we want to get the servers ready. Please perform the following steps to accomplish the task:


a. Install httpd package and dependencies on app server 3.


b. Apache should serve on port 8088.


c. There are two website's backups /home/thor/media and /home/thor/cluster on jump_host. Set them up on Apache in a way that media should work on the link http://localhost:8088/media/ and cluster should work on link http://localhost:8088/cluster/ on the mentioned app server.


d. Once configured you should be able to access the website using curl command on the respective app server, i.e curl http://localhost:8088/media/ and curl http://localhost:8088/cluster/

```


```
sudo yum install -y httpd

sudo vi /etc/httpd/conf/httpd.conf

sudo mkdir -p /var/www/html/media
sudo mkdir -p /var/www/html/cluster

sudo cp -r /tmp/media/* /var/www/html/media/
sudo cp -r /tmp/cluster/* /var/www/html/cluster/

sudo systemctl enable --now httpd

```