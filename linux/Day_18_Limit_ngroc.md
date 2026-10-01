###

```
n the Stratos Datacenter, our application server 1 is encountering performance degradation due to excessive processes held by the nfsuser user. To mitigate this issue, we need to enforce limitations on its maximum processes. Please set the maximum process limits as specified below:



a. Set the soft limit to 1027


b. Set the hard limit to 2026
```

```
sudo vi /etc/security/limits.conf

nfsuser soft nproc 1027
nfsuser hard nproc 2026
```