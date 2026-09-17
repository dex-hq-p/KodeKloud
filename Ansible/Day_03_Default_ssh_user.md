###

> On the jump host, modify the default configuration of Ansible to enable the use of rose as the default SSH user for all hosts. Ensure to make changes within Ansible's default configuration without creating a new one.

```
ssh thor@jump-host

sudo vi ansible.cfg 
[defaults]
remote_user = rose

ansible-config dump | grep -i remote_user

```