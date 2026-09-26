

```
---
- name: Create file on App Server 
  hosts: all
  become: yes
  tasks:
    - name: Create empty file
      ansible.builtin.file:
        path: /usr/src/app-t4q1.txt
        state: touch

        
```

