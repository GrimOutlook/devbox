#!/usr/bin/env bash

# Create a `sudo` group so users can use commands that require root.
groupadd sudo

# Create a user for installation. Variable taken from `input.bash`.
useradd --comment "Developer" \
        --groups sudo \
        --create-home \
        --user-group \
        --password "$NEW_USER_PASSWORD" \
        "$NEW_USERNAME"
