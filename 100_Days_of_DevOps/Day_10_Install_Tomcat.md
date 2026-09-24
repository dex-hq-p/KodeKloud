###

```
sudo yum install -y tomcat
rpm -qa | grep tomcat

sudo sed -i 's/port="8080"/port="5001"/' /etc/tomcat/server.xml

sudo systemctl enable --now tomcat

ss -lntp | grep 5001

scp /tmp/ROOT.war banner@stapp03:/tmp/

sudo cp /tmp/ROOT.war /var/lib/tomcat/webapps/

sudo journalctl -u tomcat -n 50 --no-pager

Jump Host
   │
   │ /tmp/ROOT.war
   │ scp
   ↓
App Server 1
   │
   ├── Tomcat
   │    └── port 5001
   │
   └── /var/lib/tomcat/webapps/ROOT.war

```