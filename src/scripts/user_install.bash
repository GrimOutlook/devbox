#!/usr/bin/env bash
# Set the script to exit when errors are hit
set -euxo pipefail

echo "Starting user portion install"

# Install the `yay` package manager
"$RUNNING_DIR/scripts/install/yay.bash"

# Install the Rust so it can be used to build packages. I do this here and not
# in the fish scripts because `fish` requires Rust to build.
"$RUNNING_DIR/scripts/install/rust.bash"

# Install `fish` shell.
"$RUNNING_DIR/scripts/install/fish.bash"

# Now that fish is installed, run the rest of the scripts in fish. It has a much
# better syntax. Install the packages that can be installed using yay.
"$RUNNING_DIR/scripts/install/packages.fish"

# Run the nonstandard install for regit
"$RUNNING_DIR/scripts/install/regit.fish"

echo "User portion install complete"
