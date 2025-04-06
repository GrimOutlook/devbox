#!/usr/bin/env bash
# Set the script to exit when errors are hit
set -euxo pipefail

echo "Starting user portion install"

# Install the `yay` package manager
./scripts/install/yay.bash

# Install the Rust so it can be used to build packages. I do this here and not
# in the fish scripts because `fish` requires Rust to build.
./scripts/install/rust.bash

# Install `fish` shell.
./scripts/install/fish.bash

echo "User portion install complete"
