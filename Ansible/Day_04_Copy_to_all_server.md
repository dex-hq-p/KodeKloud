###

```
The Nautilus DevOps team needs to copy data from the jump host to all application servers in Stratos DC using Ansible. Execute the task with the following details:


a. Create an inventory file /home/thor/ansible/inventory on jump_host and add all application servers as managed nodes.


b. Create a playbook /home/thor/ansible/playbook.yml on the jump host to copy the /usr/src/data/index.html file to all application servers, placing it at /opt/data.


Note: Validation will run the playbook using the command ansible-playbook -i inventory playbook.yml. Ensure the playbook functions properly without any extra arguments
```

```
stapp01 ansible_user=tony ansible_password='Ir0nM@n'
stapp02 ansible_user=steve ansible_password='Am3ric@'
stapp03 ansible_user=banner ansible_password='BigGr33n'

[app_servers]
stapp01
stapp02
stapp03

---
- name: Copy index.html to application servers
  hosts: app_servers
  become: true

  tasks:
    - name: Create /opt/data directory
      ansible.builtin.file:
        path: /opt/data
        state: directory
        mode: '0755'

    - name: Copy index.html
      ansible.builtin.copy:
        src: /usr/src/data/index.html
        dest: /opt/data/index.html
        mode: '0644'

ansible-playbook -i inventory playbook.yml

```