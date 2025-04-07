#!/usr/bin/env bash
# This file is only used during testing. Therefore strict error checking is
# ignored.

SCRIPT_DIRECTORY=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

"$SCRIPT_DIRECTORY/test.bash"
"$SCRIPT_DIRECTORY/undo.bash"