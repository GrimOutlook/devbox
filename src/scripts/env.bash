#!/usr/bin/env bash
# Set the script to exit when errors are hit
set -euxo pipefail

echo "Importing environment variables"

INSTALL_PASSWORD="$(openssl rand -base64 20)"

export INSTALL_USER="installer"
export INSTALL_PASSWORD="$INSTALL_PASSWORD"

echo "Finished importing environment variables"