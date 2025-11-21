#!/usr/bin/env bash

# Make a temp folder to move all of the scripts to and move into it
TEMP_DIRECTORY="$(mktemp -d)"

# Copy all of the scripts in this repo to a temporary location.
# $REPO_DIRECTORY is exported from the script that calls this one.
echo "Copying scripts to temp directory" >&2
cp -r "$REPO_DIRECTORY/." "$TEMP_DIRECTORY"

# Make sure even non-root users can run the scripts in the copied location.
echo "Setting permissions on copied scripts" >&2
chmod 777 -vR "$TEMP_DIRECTORY" >&2

# Echo the temporary directory that was created so it can be grabbed from the
# outer script.
echo "$TEMP_DIRECTORY"
