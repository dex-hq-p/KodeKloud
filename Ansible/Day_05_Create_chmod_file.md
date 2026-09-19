###

```
The Nautilus DevOps team is testing various Ansible modules on servers in Stratos DC. They're currently focusing on file creation on remote hosts using Ansible. Here are the details:


a. Create an inventory file ~/playbook/inventory on jump host and include all app servers.


b. Create a playbook ~/playbook/playbook.yml to create a blank file /opt/nfsshare.txt on all app servers.


c. Set the permissions of the /opt/nfsshare.txt file to 0644.


d. Ensure the user/group owner of the /opt/nfsshare.txt file is tony on app server 1, steve on app server 2 and banner on app server 3.

```
stapp01 ansible_user=tony ansible_password='Ir0nM@n'
stapp02 ansible_user=steve ansible_password='Am3ric@'
stapp03 ansible_user=banner ansible_password='BigGr33n'

[app_servers]
stapp01
stapp02
stapp03
```

- name: Create /opt/nfsshare.txt
  ansible.builtin.file:
    path: /opt/nfsshare.txt
    state: touch
    owner: "{{ ansible_user }}"
    group: "{{ ansible_user }}"
    mode: '0644'


ansible-playbook -i inventory playbook.yml

```