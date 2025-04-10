#!/usr/bin/env bash
# Set the script to exit when errors are hit
set -euxo pipefail

REPO_DIRECTORY=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
export REPO_DIRECTORY="$REPO_DIRECTORY"

# Verify that this script is being run as root
"$REPO_DIRECTORY/scripts/helpers/root_check.bash" || return 1

# Import predefined variables
source "$REPO_DIRECTORY/scripts/helpers/env.bash"

# Get the user input needed for this script to complete.
source "$REPO_DIRECTORY/scripts/helpers/input.bash"

# Create a developer user. A non root user is needed for several operations.
"$REPO_DIRECTORY/scripts/helpers/create_user.bash"

# Copy the scripts into a temporary directory.
TEMP_SCRIPTS_DIR=$("$REPO_DIRECTORY/scripts/helpers/copy_scripts.bash")
export RUNNING_DIR=$TEMP_SCRIPTS_DIR

echo "Running the next scripts as the install user [$INSTALL_USER]" >&2
sudo --preserve-env --user="$INSTALL_USER" bash << EOF
    # Because the environment is preserved, we need to set the HOME variable to
    # the correct location.
    export HOME="/home/$INSTALL_USER"
    cd "$RUNNING_DIR"
    "$RUNNING_DIR/scripts/user_install.bash"
EOF

# Remove anything temporarily added during the install
"$REPO_DIRECTORY/scripts/helpers/cleanup.bash"

echo "Installation complete"
