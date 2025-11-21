#!/usr/bin/env bash
# Set the script to exit when errors are hit
set -euxo pipefail

echo "Installing Rust"

# Install rustup instead of the rust packages individually so rustup can manage
# the components itself
yay -S --noconfirm rustup

echo "Finish installing Rust"
