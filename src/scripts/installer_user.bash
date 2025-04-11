#!/usr/bin/env bash
# Set the script to exit when errors are hit
set -euxo pipefail

echo "Starting installer user portion install"

# Because the environment is preserved from the root account, we need to set the
# HOME variable to the correct location.
export HOME="/home/$INSTALL_USER"

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

# Install the tldr pages since they don't come prepackaged.
"$RUNNING_DIR/scripts/configuration/tldr.fish"

# Run WSL configurations if running in WSL
OS_VERSION="/proc/sys/kernel/osrelease"
if [[ $(rg -i "microsoft" "$OS_VERSION") ]] && [[ $(rg -i "wsl" "$OS_VERSION") ]]; then
    "$RUNNING_DIR/scripts/configuration/wsl.fish"
fi

# TODO: Install nerd-fonts

echo "Running the next scripts as the new user [$NEW_USERNAME]" >&2
sudo --preserve-env --user="$NEW_USERNAME" "$RUNNING_DIR/scripts/new_user.fish"

echo "Installer user portion install complete"
