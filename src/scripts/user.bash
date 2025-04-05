#!/usr/bin/env bash

# Install the sudo package so users can elevate privileges.
pacman -S sudo
# Create a `sudo` group so users can use commands that require root.
groupadd sudo
# Create a `pacman` group. Users in this group will be able to run `pacman`
# commands without a password. This is can be quite dangerous but it's my
# preferred configuration.
groupadd install
# Add entries to the sudoers file for pacman and sudo group
echo "%sudo ALL=(ALL:ALL) ALL " >> /etc/sudoers.d/sudo.conf
echo "%install ALL=(ALL:ALL) NOPASSWD: /usr/bin/pacman,/usr/bin/makepkg " >> /etc/sudoers.d/install.conf

# Create a user for installation. Variable taken from `input.bash`.
useradd --comment "Developer" \
        --groups sudo,install,wheel \
        --create-home \
        --user-group \
        --password "$NEW_USER_PASSWORD" \
        "$NEW_USERNAME"
