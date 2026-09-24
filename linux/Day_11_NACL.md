###

```
Specifically, the file named /etc/resolv.conf on Nautilus App 2 server requires adjustments to its Access Control Lists (ACLs) as follows:

1. The file's user owner and group owner should be set to root.

2. Others should possess read only permissions on the file.

3. User jim must not have any permissions on the file.

4. User jerome should be granted read only permission on the file.

```

```
ls -l /etc/resolv.conf
getfacl /etc/resolv.conf

sudo chmod o+r /etc/resolv.conf

sudo setfacl -m u:jim:--- /etc/resolv.conf

sudo setfacl -m u:jerome:r-- /etc/resolv.conf
```