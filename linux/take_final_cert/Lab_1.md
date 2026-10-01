
###

```
As part of the temporary resource allocation, Mariyam has been appointed to the Nautilus project as a backup developer. To facilitate this, a temporary user account is required for Mariyam. It is advisable to create a user account with a specified expiration date to ensure restricted server access beyond the designated period.


A user profile under the name mariyam has already been established on App Server 2 within the Stratos Datacenter. Adjust the account's expiration date to 2027-03-28. Additionally, locate all files (excluding directories) owned by this user within the /home/usersdata directory and copy them to the /official directory while maintaining their original ownership.
```

```
check cac user
cut -d: -f1 /etc/passwd

sudo usermod -e 2027-03-28 mariyam

## check lich su
sudo chage -l mariyam

```