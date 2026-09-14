###
> Create a user named yousuf on App Server 2 in Stratos Datacenter. Set the expiry date to 2026-12-07, ensuring the user is created in lowercase as per standard protocol.

```
ssh steve@stapp02

sudo useradd -e 2026-12-07 yousuf

sudo chage -l yousuf

```
