#!/usr/bin/env bash
# This file is only used during testing. Therefore strict error checking is
# ignored.

echo "Undoing install..."

SCRIPT_DIRECTORY=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source "$SCRIPT_DIRECTORY/test_env.bash"

userdel "$NEW_USERNAME"
groupdel "sudo"

echo "Finished undoing install."