###
> a. Create a user named ravi on App server 3 within the Stratos Datacenter.
> b. Assign a unique UID 1378 and designate the home directory as /var/www/ravi.

```
ssh banner@stapp03
sudo useradd -u 1378 -d /var/www/ravi ravi

id ravi
getent passwd ravi
ls -ld /var/www/ravi
```
