#!/usr/bin/env fish

echo "Starting new user portion install"

# Because the environment is preserved from the installer account, we need to
# set the HOME variable to the correct location.
set -gx HOME "/home/$NEW_USERNAME"
export HOME=$HOME

# TODO: Setup SSH keys for given hosts so they can be used when pulling down
# user's dotfiles repo.

# Install the user's dotfiles repo
"$RUNNING_DIR/scripts/install/dotfiles.fish"

echo "New user portion install complete"