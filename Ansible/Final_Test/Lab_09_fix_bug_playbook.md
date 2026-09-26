###

```
A team member completed writing a playbook, but when we attempted to execute it, an error occurred. We need someone to review the playbook, identify the issue, and fix it.


The playbook name is /home/thor/ansible/playbook-t1q5.yml, make sure it executes without any error.
```

```
#### error
---
- host: localhost
  connection: local
  tasks:
    - name: Debug a message
      debug:
        msg: "Hello There!"

######
---
- hosts: localhost
  connection: local
  tasks:
    - name: Debug a message
      debug:
        msg: "Hello There!"
```

