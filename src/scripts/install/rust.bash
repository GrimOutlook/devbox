#!/usr/bin/env bash
# Set the script to exit when errors are hit
set -euxo pipefail

echo "Installing Rust"

# Run the standard rustup command provided by https://rustup.rs/. Add the `-y`
# option which means that it won't prompt the user for input.
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Source the new rust binaries.
# shellcheck disable=SC1091
source "$HOME/.cargo/env"

echo "Finish installing Rust"