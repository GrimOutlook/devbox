#!/usr/bin/env bash

echo "Cleaning up install artifacts"

userdel --remove "$INSTALL_USER"

echo "Finished cleaning up install artifacts"
