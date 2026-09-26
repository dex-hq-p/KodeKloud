###

```
In the daily standup, it was noted that the timezone settings across the Nautilus Application Servers in the Stratos Datacenter are inconsistent with the local datacenter's timezone, currently set to Asia/Manila.

Synchronize the timezone settings to match the local datacenter's timezone (Asia/Manila).
```

```
ssh tony@stapp02 'sudo timedatectl set-timezone Asia/Manila'
ssh tony@stapp02 'timedatectl status'
```