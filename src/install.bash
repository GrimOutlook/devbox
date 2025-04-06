#!/usr/bin/env bash
# Set the script to exit when errors are hit
set -euxo pipefail

REPO_DIRECTORY=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
export REPO_DIRECTORY="$REPO_DIRECTORY"

# Verify that this script is being run as root
"$REPO_DIRECTORY/scripts/root_check.bash" || exit 1

# Import predefined variables
source "$REPO_DIRECTORY/scripts/env.bash"

# Get the user input needed for this script to complete.
# I shouldn't have to add this linter disable line but for some reason it isn't
# understanding how to find the ./scripts/input.bash
source "$REPO_DIRECTORY/scripts/input.bash"

# Create a developer user. A non root user is needed for several operations.
"$REPO_DIRECTORY/scripts/user.bash"

# Copy the scripts into a temporary directory.
TEMP_SCRIPTS_DIR=$("$REPO_DIRECTORY/scripts/copy_scripts.bash")

echo "Running the next scripts as the install user [$INSTALL_USER]" >&2
sudo --preserve-env --user="$INSTALL_USER" bash << EOF
    # Because the environment is preserved, we need to set the HOME variable to
    # the correct location.
    export HOME="/home/$INSTALL_USER"
    cd "$TEMP_SCRIPTS_DIR"
    "$TEMP_SCRIPTS_DIR/scripts/user_install.bash"
EOF

echo "Installation complete"
