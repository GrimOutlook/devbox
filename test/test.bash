#!/usr/bin/env bash
# This file is only used during testing. Therefore strict error checking is
# ignored.

SCRIPT_DIRECTORY=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source "$SCRIPT_DIRECTORY/test_env.bash"

"$SCRIPT_DIRECTORY/../src/install.bash" <<EOF
    $NEW_USERNAME
    $NEW_USER_PASSWORD
    $ANSWER
    $DOTFILE_REPO_LINK

EOF
