###

```
1. Install iptables and all its dependencies on each app host.

2. Block incoming port 3004 on all apps for everyone except for LBR host.

3. Make sure the rules remain, even after system reboot.
```

```
### Installs  iptables
sudo yum install -y iptables iptables-services

#Cho phép LBR host (stlb01) truy cập port 3004
sudo iptables -A INPUT -p tcp -s 10.244.221.95 --dport 3004 -j ACCEPT

# Chặn tất cả các IP khác truy cập port 3004
sudo iptables -A INPUT -p tcp --dport 3004 -j DROP

sudo service iptables save

sudo iptables -L INPUT -n --line-numbers

nc -zv stapp01 3004

```
