###

```
---
- name: Copy system file to application servers
  hosts: all
  become: yes
  tasks:
    - name: Copy system-t2q2.txt with permissions 0600
      copy:
        src: /usr/src/dba-t2q2/system-t2q2.txt
        dest: /opt/dba-t2q2/system-t2q2.txt
        mode: '0600'

ansible-playbook -i inventory-t2q2 playbook-t2q2.yml
```