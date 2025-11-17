#!/usr/bin/env bash
# Set the script to exit when errors are hit
set -euxo pipefail

echo "Installing Rust"

# Install rustup instead of the rust packages individually so rustup can manage
# the components itself
yay -S --noconfirm rustup

# Source the new rust binaries.
# shellcheck disable=SC1091
source "$HOME/.cargo/env"

echo "Finish installing Rust"
