###

```
they need to create a bash script named ecommerce_archive.sh which should accomplish the following tasks. (Also remember to place the script under the /scripts directory on App Server 3).


a. Create a zip archive named xfusioncorp_ecommerce.zip of /var/www/html/ecommerce directory.


b. Save the archive in the /archives/ directory on the App Server 3. This is a temporary storage, as archives from this location will be cleaned on a weekly basis. Therefore, the archive should also be copied to the Nautilus Storage Server so it can be retrieved later for validation purposes.


c. Copy the created archive to the Nautilus Storage Server server in the /archives/ location.


d. Please make sure script won't ask for password while copying the archive file. Additionally, the respective server user (for example, tony in case of App Server 1) must be able to run it.


e. Do not use sudo inside the script.
```

```
ssh banner@stapp03
mkdir -p /scripts /archives

ssh-keygen
==> check .ssh
ssh-copy-id natasha@ststor01
==> Test ssh natasha@ststor01

vi /scripts/ecommerce_archive.sh
#!/bin/bash

zip -r /archives/xfusioncorp_ecommerce.zip /var/www/html/ecommerce

scp /archives/xfusioncorp_ecommerce.zip natasha@ststor01:/archives/


chmod +x /scripts/ecommerce_archive.sh


App Server 3
│
├── /scripts/
│   └── ecommerce_archive.sh
│
└── /archives/
    └── xfusioncorp_ecommerce.zip
             │
             │ scp (SSH key, không password)
             ↓
Nautilus Storage Server
└── /archives/
    └── xfusioncorp_ecommerce.zip
```