#!/usr/bin/env bash
# This file is only used during testing. Therefore strict error checking is
# ignored.

echo "Undoing install..."

SCRIPT_DIRECTORY=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source "$SCRIPT_DIRECTORY/../src/scripts/env.bash"
source "$SCRIPT_DIRECTORY/test_env.bash"

# Undo any of the set flags that were activated by sourced files
set -x +euo pipefail

faillock --user "$NEW_USERNAME" --reset
faillock --user "$INSTALL_USER" --reset

userdel -r "$NEW_USERNAME"
userdel -r "$INSTALL_USER"
groupdel "sudo"
groupdel "install"

pacman --noconfirm -R sudo base-devel yay

rm -rf /etc/sudoers*

rustup self uninstall

echo "Finished undoing install."
