#!/usr/bin/env bash

PACKAGE_FILE="$RUNNING_DIR/resources/packages/cargo.txt"
PACKAGE_LIST=$(cat "$PACKAGE_FILE" | grep -v '#.*' | grep -v '^$')
for package in $PACKAGE_LIST; do
  cargo install "$package" || {
    echo "Failed to install cargo package $package to devbox"
    return 1
  }
done
