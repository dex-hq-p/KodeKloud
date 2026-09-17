###

> Install the required SELinux packages.

> Permanently disable SELinux for the time being; it will be re-enabled after necessary configuration changes.

> No need to reboot the server, as a scheduled maintenance reboot is already planned for tonight.

> Disregard the current status of SELinux via the command line; the final status after the reboot should be disabled.

```
4  sudo apt-get update
5  cat /etc/os-release
NAME="CentOS Stream"
VERSION="9"
ID="centos"
ID_LIKE="rhel fedora"
VERSION_ID="9"
PLATFORM_ID="platform:el9"
PRETTY_NAME="CentOS Stream 9
6  sudo dnf install -y selinux-policy selinux-policy-targeted
7  rpm -qa | grep selinux
8  sudo vi /etc/selinux/config
9  sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config

```