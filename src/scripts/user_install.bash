#!/usr/bin/env bash
# Set the script to exit when errors are hit
set -euxo pipefail

echo "Starting user portion install"W

# TODO: Set local/LANG

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

# TODO: Run WSL configurations if running in WSL
# "$RUNNING_DIR/scripts/install/wsl.fish"

# TODO: Install nerd-fonts

# TODO: Setup SSH keys for given hosts so they can be used when pulling down
# user's dotfiles repo.

# Install dotfiles from user input git repository.
"$RUNNING_DIR/scripts/install/dotfiles.fish"

echo "User portion install complete"
