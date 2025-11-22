#!/usr/bin/env bash

# TODO: Add this fix to the WSL config. [Source](https://wiki.archlinux.org/title/Install_Arch_Linux_on_WSL#systemd_requires_plain_cgroup_v2_support)
# [wsl2]
# kernelCommandLine = cgroup_no_v1=all systemd.unified_cgroup_hierarchy=1

# TODO: Add interop to remove windows path
# [interop]
# appendWindowsPath = false

# TODO: Make the default user the developer user

# TODO: Enable systemd if it isn't already.

# TODO: Add auto-mount script for removable drives.
# https://superuser.com/questions/1734353/is-there-a-way-to-mount-an-external-drive-when-it-becomes-available-in-wsl

# Likely a service that scans runs a powershell command to get all drive letters
# and then we parse out all the drive letters that aren't mounted and then run
# the `sudo mount -t drvfs [LETTER]: /mnt/[letter]` command

sudo bash  << EOF2

rm /etc/wsl.conf

cat > /etc/wsl.conf < EOF
[user]
default = $NEW_USERNAME

[boot]
systemd = true

[interop]
appendWindowsPath = false
EOF
EOF2
