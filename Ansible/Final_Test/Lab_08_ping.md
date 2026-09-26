###

```
a. The Jump host serves as our Ansible controller, and the Ansible playbooks will be executed through the thor user from the jump host.

b. An inventory file, /home/thor/playbook/inventory-t3q2, is available on the jump host. Utilize this inventory file to perform an Ansible ping from the jump host to App Server 1 and ensure the successful execution of the ping command.
```

```
stapp01 ansible_host=stapp01 ansible_user=tony ansible_password=Ir0nM@n
stapp02 ansible_host=stapp02 ansible_user=steve ansible_password=Am3ric@
stapp03 ansible_host=stapp03 ansible_user=banner ansible_password=BigGr33n


ansible all  -i /home/thor/playbook/inventory-t3q2 -m ping
```