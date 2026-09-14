###
> Create empty file
> The inventory file /home/thor/ansible/inventory requires adjustments. The playbook must run on App Server 3 in Stratos DC. Update the inventory accordingly.

> Create a playbook /home/thor/ansible/playbook.yml. Include a task to create an empty file /tmp/file.txt on App Server 3.

```
---
- name: Create file on App Server 3
  hosts: stapp03
  become: true

  tasks:
    - name: Create empty file
      ansible.builtin.file:
        path: /tmp/file.txt
        state: touch
```
```
ansible-playbook -i inventory playbook.yml 
```