###

```
Delete file from all App Servers
```

```
---
- name: Delete file from all App Servers
  hosts: all
  become: yes
  tasks:
    - name: Remove /opt/fruits-t4q4.txt file
      ansible.builtin.file:
        path: /opt/fruits-t4q4.txt
        state: absent
```
