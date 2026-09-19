###

> Set up a password-less authentication from user thor on jump host to all app servers through their respective sudo users.

```
    1  ssh-keygen 
    2  ssh-copy-id .ssh/id_ed25519.pub tony@stapp01
    3  ssh-copy-id ~/.ssh/id_ed25519.pub tony@stapp01
    4  ssh-copy-id -i .ssh/id_ed25519.pub tony@stapp01
    5  ssh-copy-id -i ~/.ssh/id_ed25519.pub steve@stapp02
    6  ssh-copy-id -i ~/.ssh/id_ed25519.pub banner@stapp03
    7  ssh tony@stapp01
```