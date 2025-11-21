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
sudo groupadd android-sdk
sudo gpasswd -a "$NEW_USERNAME" android-sdk
sudo setfacl -R -m g:android-sdk:rwx /opt/android-sdk
sudo setfacl -d -m g:android-sdk:rwX /opt/android-sdk

SDK_MANAGER="/opt/android-sdk/cmdline-tools/latest/bin/sdkmanager"
ANDROID_SYSTEM_IMAGE="$("$SDK_MANAGER" --list | awk '{print $1}' | grep "system-images.*google_apis" | grep -v "CANARY\|ps16k\|playstore\|arm64" | sort | tail -n1)"
# Install System Image
echo "y" | "$SDK_MANAGER" --install "$ANDROID_SYSTEM_IMAGE"

AVD_MANAGER="/opt/android-sdk/cmdline-tools/latest/bin/avdmanager"
# Create the AVD
echo "n" | "$AVD_MANAGER" create avd --name phone -k "$ANDROID_SYSTEM_IMAGE"

echo "Finished installing Android development tools"
