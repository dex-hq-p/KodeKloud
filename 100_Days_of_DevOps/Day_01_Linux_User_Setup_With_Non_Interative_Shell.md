###
> Create user non interative 
>
> username: tony 
> password: 123
> hostname: server1

```
ssh tony@server1
sudo useradd -s /sbin/nologin tony
```