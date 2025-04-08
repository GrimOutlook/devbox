#!/usr/bin/env bash

# Get the username for the user to create
read -p "Username to create: " NEW_USERNAME
export NEW_USERNAME=$NEW_USERNAME

# Get the password to user for this new user
read -p "Password for new user [$NEW_USERNAME]: " -s NEW_USER_PASSWORD
export NEW_USER_PASSWORD="$NEW_USER_PASSWORD"
