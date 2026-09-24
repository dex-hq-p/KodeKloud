###

```
Our monitoring tool has reported an issue in Stratos Datacenter. One of our app servers has an issue, as its Apache service is not reachable on port 8084 (which is the Apache port). The service itself could be down, the firewall could be at fault, or something else could be causing the issue.


Use tools like telnet, netstat, etc. to find and fix the issue. Also make sure Apache is reachable from the jump host without compromising any security settings.

Once fixed, you can test the same using command curl http://stapp03:8084 command from jump host.

Note: Please do not try to alter the existing index.html code, as it will lead to task failure.

```

```
curl -I http://stapp03:8084
=>> có thể call api dc

kiem tra apache
systemctl status httpd

kiem tra xem co listen port 8084
sudo ss -lntp | grep 8084


==> kiem tra toi fireware
sudo firewall-cmd --list-ports

```
