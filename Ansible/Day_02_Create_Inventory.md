###
>
a. Create an ini type Ansible inventory file /home/thor/playbook/inventory on jump host.
b. Include App Server 2 in this inventory along with necessary variables for proper functionality.
c. Ensure the inventory hostname corresponds to the server name as per the wiki, for example stapp01 for app server 1 in Stratos DC.


```
inventory
stapp02 ansible_user=steve ansible_password='Am3ric@'

---
- hosts: all
  become: yes
  become_user: root
  tasks:
    - name: Install httpd package    
      yum: 
        name: httpd 
        state: installed
    
    - name: Start service httpd
      service:
        name: httpd
        state: started


ansible-playbook -i inventory playbook.yml

```