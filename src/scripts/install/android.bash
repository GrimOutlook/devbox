#!/usr/bin/env bash
# Set the script to exit when errors are hit
set -euxo pipefail

echo "Installing Android development tools"

yay -S --noconfirm \
  android-sdk-cmdline-tools-latest \
  android-sdk-platform-tools \
  android-udev android-sdk-build-tools \
  android-sdk-platform-tools \
  android-platform \
  android-emulator

# Create a group that can write to the android SDK path
# NOTE: Warnings appear if this isn't done
groupadd android-sdk
gpasswd -a "$NEW_USERNAME" android-sdk
setfacl -R -m g:android-sdk:rwx /opt/android-sdk
setfacl -d -m g:android-sdk:rwX /opt/android-sdk

echo "Finished installing Android development tools"
