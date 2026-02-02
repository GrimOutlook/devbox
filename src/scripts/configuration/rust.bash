#!/usr/bin/env bash
# Set the script to exit when errors are hit
set -euxo pipefail

echo "Installing Rust components"

yay -S --noconfirm rustup || {
  echo "Failed to install rustup to devbox"
  exit 1
}

rustup toolchain install stable nightly

echo "Finish installing Rust components"
