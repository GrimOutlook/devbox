#!/usr/bin/env bash
# Set the script to exit when errors are hit
set -euxo pipefail

if [ "$(id -u)" -ne 0 ]; then
    echo "DEVBOX install must be done by a root user." >&2
    return 1
fi
