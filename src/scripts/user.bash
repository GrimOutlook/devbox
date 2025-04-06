#!/usr/bin/env bash
# Set the script to exit when errors are hit
set -euxo pipefail

# Install the sudo package so non root users can run commands as root.
pacman -Syy --needed --noconfirm sudo

# Add entries to the sudoers file for the install user so it can run all
# commands without passwords. This is needed because several tools
# will not allow you to run as root for safety reasons.
echo "$INSTALL_USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Create a user for installation. Variables taken from `input.bash`.
useradd --comment "Installation user" \
        --create-home \
        --user-group \
        --password "$INSTALL_PASSWORD" \
        "$INSTALL_USER"

# Users in the `sudo` group are allowed to run any commands with the sudo
# command but must enter the correct password. 
groupadd sudo
echo "%sudo ALL=(ALL:ALL)" >> /etc/sudoers.d/sudo.conf
# Create a user for installation. Variables taken from `env.bash`.
# TODO: Do I need to add a `groupadd wheel` command to ensure this command
# doesn't fail?
useradd --comment "Developer" \
        --groups sudo,wheel \
        --create-home \
        --user-group \
        --password "$NEW_USER_PASSWORD" \
        "$NEW_USERNAME"
