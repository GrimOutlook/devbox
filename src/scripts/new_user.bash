#!/usr/bin/env bash

echo "Starting new user portion install"

# Because the environment is preserved from the installer account, we need to
# set the HOME variable to the correct location.
export HOME="/home/$NEW_USERNAME"

# Install the Rust so it can be used to build packages.
"$RUNNING_DIR/scripts/configuration/rust.bash"

# TODO: Setup SSH keys for given hosts so they can be used when pulling down
# user's dotfiles repo.

# Install the user's dotfiles repo
"$RUNNING_DIR/scripts/install/dotfiles.bash"

echo "New user portion install complete"
