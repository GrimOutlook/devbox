#!/usr/bin/env bash

# Make a temp folder to move all of the scripts to and move into it
TEMP_DIRECTORY="$(mktemp -d)"
pushd "$TEMP_DIRECTORY" >/dev/null || exit 1

# Return to the original directory if any errors are hit, or when this script
# exits in general
# TODO: Figure out if later scripts run outside of this one are affected by this
# call to `trap`.
trap "{ popd >/dev/null; exit 1; }" SIGINT SIGTERM ERR EXIT

# Copy all of the scripts in this repo to a temporary location.
# $REPO_DIRECTORY is exported from the script that calls this one.
cp -r "$REPO_DIRECTORY/." .

# Make sure even non-root users can run the scripts in the copied location.
chmod +x -R .

# Echo the temporary directory that was created so ut can be grabbed from the
# outer script.
echo "$TEMP_DIRECTORY"