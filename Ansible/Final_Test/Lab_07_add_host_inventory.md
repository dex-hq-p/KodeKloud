###

```
There is an inventory file /home/thor/playbook/inventory-t3q3 on jump host. It has some aliases named web1, web2 and web3 for three hosts respectively. Update this inventory file to add an alias called db1 for server4.company.com host.
```

```
# Sample Inventory File

web1 ansible_host=server1.company.com
web2 ansible_host=server2.company.com
web3 ansible_host=server3.company.com
db1  ansible_host=server4.company.com
```