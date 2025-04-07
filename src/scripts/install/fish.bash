#!/usr/bin/env bash
# Set the script to exit when errors are hit
set -euxo pipefail

echo "Installing fish shell"

yay -S --noconfirm fish

echo "Finished installing fish shell"