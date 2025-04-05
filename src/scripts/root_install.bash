#!/usr/bin/env bash

# Set the script to exit when errors are hit
set -euxo pipefail

# Verify that this script is being run as root
./scripts/root_check.bash || exit 1

# Get the user input needed for this script to complete
source ./scripts/input.bash

# Create and change to a different user
./scripts/user.bash

# Install the `yay` package manager
./scripts/install/yay.bash

echo "INSTALLATION COMPLETE"
