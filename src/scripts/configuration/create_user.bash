#!/usr/bin/env bash
# Set the script to exit when errors are hit
set -euo pipefail

# Install the sudo package so non root users can run commands as root.
# Also install shadow because for some reason a part of the install is broken if
# it is not included. This is only noticed when trying to run podman later.
pacman -Syyu --needed --noconfirm sudo shadow

# Add entries to the sudoers file for the install user so it can run all
# commands without passwords. This is needed because several tools
# will not allow you to run as root for safety reasons.
#
# NOTE: WHY TF ARE THERE SO MANY HIDDEN RULES ABOUT INCLUDED SUDOER.D FILES?!?!?!
# For future me, I have learned that to be included the file cannot have a `~` or,
# the one that got me, a `.` in it and it ALSO MUST end with a newline. The iles 
# permissions must also be set to 0440
echo -e "$INSTALL_USER ALL=(ALL) NOPASSWD: ALL\n" >>/etc/sudoers.d/installer
chmod 0440 /etc/sudoers.d/installer

# Create a user for installation. Variables taken from `env.bash`.
useradd --comment "Installation user" \
  --create-home \
  --user-group \
  --password "$INSTALL_PASSWORD" \
  "$INSTALL_USER"

# Users in the `sudo` group are allowed to run any commands with the sudo
# command but must enter the correct password.
groupadd sudo
echo -e "%sudo ALL=(ALL:ALL) ALL\n" >>/etc/sudoers.d/sudo
chmod 0440 /etc/sudoers.d/sudo
# Create the user that will be used for developerment. Variables taken from `input.bash`.
# TODO: Do I need to add a `groupadd wheel` command to ensure this command
# doesn't fail?
useradd --comment "Developer" \
  --groups sudo,wheel \
  --create-home \
  --user-group \
  --password "$NEW_USER_PASSWORD" \
  "$NEW_USERNAME"
