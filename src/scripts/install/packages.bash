#!/usr/bin/env bash
set -euxo pipefail

echo "Installing default packages"

PACKAGE_FILE="$RUNNING_DIR/resources/packages/yay.txt"
PACKAGE_LIST=$(cat "$PACKAGE_FILE" | grep -v '#.*' | grep -v '^$')
for package in $PACKAGE_LIST; do
  yay -S --noconfirm "$package" || {
    echo "Failed to install $package to devbox"
    return 1
  }
done

echo "Finished installing default packages"
