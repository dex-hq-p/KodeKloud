###

```
 On jump host create a playbook /home/thor/ansible/playbook-t2q4.yml to copy /usr/src/dba-t2q4/devops-t2q4.txt file on same host at location /opt/dba-t2q4 with group and owner should be thor.

---
- name: Copy file on jump host with specific owner and group
  hosts: localhost
  connection: local
  become: yes
  tasks:
    - name: Ensure destination directory exists
      file:
        path: /opt/dba-t2q4
        state: directory
        owner: thor
        group: thor
        mode: '0755'

    - name: Copy devops-t2q4.txt to /opt/dba-t2q4 with owner and group thor
      copy:
        src: /usr/src/dba-t2q4/devops-t2q4.txt
        dest: /opt/dba-t2q4/devops-t2q4.txt
        owner: thor
        group: thor
        remote_src: yes

```