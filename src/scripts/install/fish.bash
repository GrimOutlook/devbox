#!/usr/bin/env bash
# Set the script to exit when errors are hit
set -euxo pipefail

echo "Installing fish shell"

yay -S --noconfirm fish

# Make the new user's default shell fish
sudo usermod --shell /usr/bin/fish $NEW_USERNAME

echo "Finished installing fish shell"