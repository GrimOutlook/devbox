#!/usr/bin/env bash

if [ $(id -u) -ne 0 ]; then
    echo "DEVBOX install must be done by a root user." >&2
    exit 1
fi
